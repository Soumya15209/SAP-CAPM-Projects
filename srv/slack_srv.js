// srv/slack-service.js
const cds = require('@sap/cds');
const crypto = require('crypto');
const express = require('express');
const bodyParser = require('body-parser');

module.exports = cds.service.impl(async function() {

        this.before('slackEvent', verifySlackRequest);

        this.on('slackEvent', async (req,res) => {
        console.log('************* Received Slack event:');
        const { type, challenge } = req.data;

        if (type === 'url_verification') {
            res.status(200).send(challenge);
        } else {
            return { message: `Received type: ${type}` };
        }
        
    });
});

// Authenticating Slack Request
const verifySlackRequest = (req, res, next) => {
    const slackSignature = req.headers['x-slack-signature'];
    const slackTimestamp = req.headers['x-slack-request-timestamp'];
    const body = req.rawBody; // Capture raw body of the request

    if (!slackSignature || !slackTimestamp || !body) {
        return res.status(400).send('Bad Request');
    }

    const time = Math.floor(Date.now() / 1000);
    if (Math.abs(time - slackTimestamp) > 300) { // 5 minutes tolerance
        return res.status(400).send('Request timestamp is outside of the tolerance zone');
    }

    const sigBaseString = `v0:${slackTimestamp}:${body}`;
    const hmac = crypto.createHmac('sha256', process.env.SLACK_SIGNING_SECRET);
    const hash = `v0=${hmac.update(sigBaseString).digest('hex')}`;

    if (crypto.timingSafeEqual(Buffer.from(hash, 'utf8'), Buffer.from(slackSignature, 'utf8'))) {
        return next();
    } else {
        return res.status(400).send('Verification failed');
    }
};