using app.slack from '../db/slack';

service Slack {
    entity Employees as projection on slack.Employees;

    @open
    type object{};
    action slackEvent(token: String, challenge: String, type : String);
   //action slackEvent(data : object) returns String;

}
