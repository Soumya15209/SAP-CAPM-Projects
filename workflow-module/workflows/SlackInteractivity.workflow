{
	"contents": {
		"0c6063c8-d965-4b5f-9c17-4222b68d72cf": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "slackinteractivity",
			"subject": "SlackInteractivity",
			"name": "SlackInteractivity",
			"documentation": "",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "StartEvent1"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "EndEvent1"
				},
				"6f23d462-c613-41e3-9010-abb69386733a": {
					"name": "EndEvent2"
				}
			},
			"activities": {
				"62102d68-f551-4945-bc9d-f852153c9c5c": {
					"name": "Prepare Slack Msg"
				},
				"ac09e9fc-b4ea-455a-9c73-41dc7d50f6a6": {
					"name": "Send To Slack"
				},
				"ab7a25ba-afeb-4386-95cb-5753045ae4fc": {
					"name": "UserTask1"
				},
				"53ffe22c-56b0-493e-bd3e-3eb51775320d": {
					"name": "Approve?"
				},
				"5977c630-f9d8-45da-be9f-271d4135695f": {
					"name": "Approve Email"
				},
				"06a9be5b-ad00-4797-97b6-41db22b08725": {
					"name": "ScriptTask4"
				}
			},
			"sequenceFlows": {
				"506d4083-1fcd-4e5c-a073-820910c62b81": {
					"name": "SequenceFlow2"
				},
				"73db75e7-722b-4b52-b00c-8a08de8c6ace": {
					"name": "SequenceFlow4"
				},
				"58ac8587-d182-42c7-9afa-be096cd6c0f3": {
					"name": "SequenceFlow9"
				},
				"d358d923-2c85-4a15-9eb1-bf18e0337dc9": {
					"name": "SequenceFlow20"
				},
				"19a1b7c7-1472-4787-822b-ba726d4b9c8c": {
					"name": "Yes"
				},
				"7456efe8-380a-4a46-a7da-68f4bcfd1f26": {
					"name": "SequenceFlow24"
				},
				"456ce39f-f24b-40c0-aa69-96da5e9f0f69": {
					"name": "No"
				},
				"f4485906-6e5f-4e88-a40e-23a72da6036b": {
					"name": "SequenceFlow26"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1"
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"6f23d462-c613-41e3-9010-abb69386733a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent2",
			"name": "EndEvent2"
		},
		"62102d68-f551-4945-bc9d-f852153c9c5c": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/SlackInteractivity/SlackMsg.js",
			"id": "scripttask1",
			"name": "Prepare Slack Msg"
		},
		"ac09e9fc-b4ea-455a-9c73-41dc7d50f6a6": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "SlackNotification",
			"destinationSource": "consumer",
			"path": "/B0750THU1LL/m29ggeLpVDF1v7nXQIT9zsJ9",
			"httpMethod": "POST",
			"requestVariable": "${context.slackmessage}",
			"responseVariable": "",
			"id": "servicetask1",
			"name": "Send To Slack"
		},
		"ab7a25ba-afeb-4386-95cb-5753045ae4fc": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approval Required",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "soumya.itagi@ibm.com",
			"formReference": "/forms/SlackInteractivity/ApprovalForm.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "approvalform"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask1",
			"name": "UserTask1"
		},
		"53ffe22c-56b0-493e-bd3e-3eb51775320d": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway3",
			"name": "Approve?",
			"default": "456ce39f-f24b-40c0-aa69-96da5e9f0f69"
		},
		"5977c630-f9d8-45da-be9f-271d4135695f": {
			"classDefinition": "com.sap.bpm.wfs.MailTask",
			"destinationSource": "consumer",
			"id": "mailtask5",
			"name": "Approve Email",
			"mailDefinitionRef": "850a31b9-fa06-417a-ba75-c6b312632f7d"
		},
		"506d4083-1fcd-4e5c-a073-820910c62b81": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "ab7a25ba-afeb-4386-95cb-5753045ae4fc"
		},
		"73db75e7-722b-4b52-b00c-8a08de8c6ace": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow4",
			"name": "SequenceFlow4",
			"sourceRef": "62102d68-f551-4945-bc9d-f852153c9c5c",
			"targetRef": "ac09e9fc-b4ea-455a-9c73-41dc7d50f6a6"
		},
		"58ac8587-d182-42c7-9afa-be096cd6c0f3": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow9",
			"name": "SequenceFlow9",
			"sourceRef": "ac09e9fc-b4ea-455a-9c73-41dc7d50f6a6",
			"targetRef": "5977c630-f9d8-45da-be9f-271d4135695f"
		},
		"d358d923-2c85-4a15-9eb1-bf18e0337dc9": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow20",
			"name": "SequenceFlow20",
			"sourceRef": "ab7a25ba-afeb-4386-95cb-5753045ae4fc",
			"targetRef": "53ffe22c-56b0-493e-bd3e-3eb51775320d"
		},
		"19a1b7c7-1472-4787-822b-ba726d4b9c8c": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask1.last.decision==\"approve\"}",
			"id": "sequenceflow21",
			"name": "Yes",
			"sourceRef": "53ffe22c-56b0-493e-bd3e-3eb51775320d",
			"targetRef": "62102d68-f551-4945-bc9d-f852153c9c5c"
		},
		"7456efe8-380a-4a46-a7da-68f4bcfd1f26": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow24",
			"name": "SequenceFlow24",
			"sourceRef": "5977c630-f9d8-45da-be9f-271d4135695f",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"7f7d7676-800b-47a0-b511-28ff6d75e358": {},
				"223b67d8-9e05-4e78-a31f-e7ff5f0963a3": {},
				"566b74c6-56e9-48b2-839c-6e0975a59d42": {},
				"5468072b-6379-40da-9f01-dea06b124287": {},
				"72e1b17c-a3f7-469d-b201-f3fc0bd1df0f": {},
				"8dfbcc8e-564e-4f12-b39f-912b95935f5c": {},
				"edd7e9ef-e306-4916-888a-bac0d12c3807": {},
				"3a7b9ca1-cef7-42b0-a6f4-9ab95b136b9d": {},
				"0ab4afdb-b28d-4f39-af88-83f270134100": {},
				"b0d394c8-c87b-49ac-ad75-72e0bc55eb55": {},
				"7e3aa9ea-f241-4a83-bd0b-0fae920b5034": {},
				"5f53ef34-3589-4f03-8b3d-2e872febff0e": {},
				"fc5262e8-bf06-4a2a-86c1-50d84083a150": {},
				"f4e401a9-9a48-436f-89f4-90741705bf9b": {},
				"9298899c-0a4c-492c-9079-d892070524c8": {}
			}
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": -110,
			"y": 71,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 612,
			"y": 67,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"7f7d7676-800b-47a0-b511-28ff6d75e358": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 206,
			"y": 57,
			"width": 100,
			"height": 60,
			"object": "62102d68-f551-4945-bc9d-f852153c9c5c"
		},
		"223b67d8-9e05-4e78-a31f-e7ff5f0963a3": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-94,87 23,87",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "8dfbcc8e-564e-4f12-b39f-912b95935f5c",
			"object": "506d4083-1fcd-4e5c-a073-820910c62b81"
		},
		"566b74c6-56e9-48b2-839c-6e0975a59d42": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 326,
			"y": 57,
			"width": 100,
			"height": 60,
			"object": "ac09e9fc-b4ea-455a-9c73-41dc7d50f6a6"
		},
		"5468072b-6379-40da-9f01-dea06b124287": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "256,90 349,90",
			"sourceSymbol": "7f7d7676-800b-47a0-b511-28ff6d75e358",
			"targetSymbol": "566b74c6-56e9-48b2-839c-6e0975a59d42",
			"object": "73db75e7-722b-4b52-b00c-8a08de8c6ace"
		},
		"72e1b17c-a3f7-469d-b201-f3fc0bd1df0f": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "376,87 520,87",
			"sourceSymbol": "566b74c6-56e9-48b2-839c-6e0975a59d42",
			"targetSymbol": "7e3aa9ea-f241-4a83-bd0b-0fae920b5034",
			"object": "58ac8587-d182-42c7-9afa-be096cd6c0f3"
		},
		"8dfbcc8e-564e-4f12-b39f-912b95935f5c": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": -27,
			"y": 57,
			"width": 100,
			"height": 60,
			"object": "ab7a25ba-afeb-4386-95cb-5753045ae4fc"
		},
		"edd7e9ef-e306-4916-888a-bac0d12c3807": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "23,87.5 136,87.5",
			"sourceSymbol": "8dfbcc8e-564e-4f12-b39f-912b95935f5c",
			"targetSymbol": "3a7b9ca1-cef7-42b0-a6f4-9ab95b136b9d",
			"object": "d358d923-2c85-4a15-9eb1-bf18e0337dc9"
		},
		"3a7b9ca1-cef7-42b0-a6f4-9ab95b136b9d": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 115,
			"y": 67,
			"object": "53ffe22c-56b0-493e-bd3e-3eb51775320d"
		},
		"0ab4afdb-b28d-4f39-af88-83f270134100": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "136,87.5 256,87.5",
			"sourceSymbol": "3a7b9ca1-cef7-42b0-a6f4-9ab95b136b9d",
			"targetSymbol": "7f7d7676-800b-47a0-b511-28ff6d75e358",
			"object": "19a1b7c7-1472-4787-822b-ba726d4b9c8c"
		},
		"b0d394c8-c87b-49ac-ad75-72e0bc55eb55": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 408.5,
			"y": 243.5,
			"width": 35,
			"height": 35,
			"object": "6f23d462-c613-41e3-9010-abb69386733a"
		},
		"7e3aa9ea-f241-4a83-bd0b-0fae920b5034": {
			"classDefinition": "com.sap.bpm.wfs.ui.MailTaskSymbol",
			"x": 470,
			"y": 57,
			"width": 100,
			"height": 60,
			"object": "5977c630-f9d8-45da-be9f-271d4135695f"
		},
		"5f53ef34-3589-4f03-8b3d-2e872febff0e": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "520,85.75 629.5,85.75",
			"sourceSymbol": "7e3aa9ea-f241-4a83-bd0b-0fae920b5034",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "7456efe8-380a-4a46-a7da-68f4bcfd1f26"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"messageeventdefinition": 1,
			"timereventdefinition": 1,
			"maildefinition": 5,
			"escalationeventdefinition": 1,
			"intermediateescalationevent": 1,
			"sequenceflow": 28,
			"startevent": 1,
			"intermediatemessageevent": 1,
			"intermediatetimerevent": 1,
			"endevent": 2,
			"usertask": 1,
			"servicetask": 3,
			"scripttask": 4,
			"mailtask": 5,
			"exclusivegateway": 3,
			"parallelgateway": 1
		},
		"850a31b9-fa06-417a-ba75-c6b312632f7d": {
			"classDefinition": "com.sap.bpm.wfs.MailDefinition",
			"name": "maildefinition5",
			"to": "soumyaitagi246@gmail.com",
			"subject": "Your Request has been approved",
			"text": "Hi,\nYour request has been approved.\n\nBest Regards.",
			"id": "maildefinition5"
		},
		"06a9be5b-ad00-4797-97b6-41db22b08725": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/SlackInteractivity/RejectMsg.js",
			"id": "scripttask4",
			"name": "ScriptTask4"
		},
		"fc5262e8-bf06-4a2a-86c1-50d84083a150": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 86,
			"y": 231,
			"width": 100,
			"height": 60,
			"object": "06a9be5b-ad00-4797-97b6-41db22b08725"
		},
		"456ce39f-f24b-40c0-aa69-96da5e9f0f69": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow25",
			"name": "No",
			"sourceRef": "53ffe22c-56b0-493e-bd3e-3eb51775320d",
			"targetRef": "06a9be5b-ad00-4797-97b6-41db22b08725"
		},
		"f4e401a9-9a48-436f-89f4-90741705bf9b": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "136.5,88 136.5,231.5",
			"sourceSymbol": "3a7b9ca1-cef7-42b0-a6f4-9ab95b136b9d",
			"targetSymbol": "fc5262e8-bf06-4a2a-86c1-50d84083a150",
			"object": "456ce39f-f24b-40c0-aa69-96da5e9f0f69"
		},
		"f4485906-6e5f-4e88-a40e-23a72da6036b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow26",
			"name": "SequenceFlow26",
			"sourceRef": "06a9be5b-ad00-4797-97b6-41db22b08725",
			"targetRef": "6f23d462-c613-41e3-9010-abb69386733a"
		},
		"9298899c-0a4c-492c-9079-d892070524c8": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "136,261 426,261",
			"sourceSymbol": "fc5262e8-bf06-4a2a-86c1-50d84083a150",
			"targetSymbol": "b0d394c8-c87b-49ac-ad75-72e0bc55eb55",
			"object": "f4485906-6e5f-4e88-a40e-23a72da6036b"
		}
	}
}