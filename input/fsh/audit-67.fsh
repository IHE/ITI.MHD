//TODO fill in the actual profiling details rather than just comments
Profile:        AuditFindDocumentReferencesConsumer
Parent:         AuditEvent
Id:             IHE.MHD.FindDocumentReferences.Audit.Consumer
Title:          "Audit Event for Find Document References Transaction"
Description:    "Defines constraints on the AuditEvent Resource to record when a Find Document References Transaction happens."
* type = http://dicom.nema.org/resources/ontology/DCM#110112 "Query"
* action = #E
* subtype = urn:ihe:event-type-code#ITI-67 "Find Document References"
// .source is already required to be populated - what agent detected the event usually one of the .agent systems sending or receiving
// .agent[0] holds system that sent the query -- RoleIDCode[@code='110153']
// .agent[1] holds the system that responds to the query -- RoleIDCode[@code='110152']
// .agent[2] if known the human(s) who triggered -- not(RoleIDCode) or RoleIDCode[@code!='110153' and @code!='110152']
// .entity[0] holds the patient identity as included in the query parameters -- @ParticipantObjectTypeCode='1' and @ParticipantObjectTypeCodeRole='1'
// .entity[1] holds the query parameters -- @ParticipantObjectTypeCode='2' and @ParticipantObjectTypeCodeRole='24'

Profile:        AuditFindDocumentReferencesResponder
Parent:         AuditEvent
Id:             IHE.MHD.FindDocumentReferences.Audit.Responder
Title:          "Audit Event for Find Document References Transaction"
Description:    "Defines constraints on the AuditEvent Resource to record when a Find Document References Transaction happens."
* type = http://dicom.nema.org/resources/ontology/DCM#110112 "Query"
* action = #E
* subtype = urn:ihe:event-type-code#ITI-67 "Find Document References"
// .source is already required to be populated - what agent detected the event usually one of the .agent systems sending or receiving
// .agent[0] holds system that sent the query -- RoleIDCode[@code='110153']
// .agent[1] holds the system that responds to the query -- RoleIDCode[@code='110152']
// .agent[2] if known the human(s) who triggered -- not(RoleIDCode) or RoleIDCode[@code!='110153' and @code!='110152']
// .entity[0] holds the patient identity as included in the query parameters -- @ParticipantObjectTypeCode='1' and @ParticipantObjectTypeCodeRole='1'
// .entity[1] holds the query parameters -- @ParticipantObjectTypeCode='2' and @ParticipantObjectTypeCodeRole='24'
