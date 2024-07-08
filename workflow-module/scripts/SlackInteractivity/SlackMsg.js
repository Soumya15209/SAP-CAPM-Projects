$.context.slackmessage = {
	
	"attachments": [
		{
			"fallback": "A new payment has to be approved:",
			"title": "Payment Approval:" && $.context.firstname,
			"text": "Payment has been approved ",
			"callback_id": "slack_id",
			"fields": [{
				"title": "Employee Name",
				"value": $.context.firstname + $.context.lastname,
				"short": true
			},
			{
				"title": "Designation",
				"value": $.context.designation,
				"short": true
			},
			{
				"title": "Equiment Name",
				"value": $.context.itequipment,
				"short": true
			},
			{
				"title": "Invoice Amount",
				"value": $.context.price,
				"short": true
			}]
		}
	]
};


// ,
// 			"actions":[
// 				{
// 					"name":"approve",
// 					"text":"Approve",
// 					"type":"button",
// 					"value":"approve"
// 				},
// 				{
// 					"name":"reject",
// 					"text":"Reject",
// 					"type":"button",
// 					"value":"reject"
// 				}
// 			]

//$.context.response = {};



/*
// read from existing workflow context 
var productInfo = $.context.productInfo; 
var productName = productInfo.productName; 
var productDescription = productInfo.productDescription;

// read contextual information
var taskDefinitionId = $.info.taskDefinitionId;

// read user task information
var lastUserTask1 = $.usertasks.usertask1.last;
var userTaskSubject = lastUserTask1.subject;
var userTaskProcessor = lastUserTask1.processor;
var userTaskCompletedAt = lastUserTask1.completedAt;

var userTaskStatusMessage = " User task '" + userTaskSubject + "' has been completed by " + userTaskProcessor + " at " + userTaskCompletedAt;

// create new node 'product'
var product = {
		productDetails: productName  + " " + productDescription,
		workflowStep: taskDefinitionId
};

// write 'product' node to workflow context
$.context.product = product;
*/
