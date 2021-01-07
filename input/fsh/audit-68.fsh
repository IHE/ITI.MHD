//TODO fill in the actual profiling details rather than just comments
Profile:        AuditRetrieveDocumentConsumer
Parent:         AuditEvent
Id:             IHE.MHD.RetrieveDocument.Audit.Consumer
Title:          "Audit Event for Retrieve Document Transaction"
Description:    "Defines constraints on the AuditEvent Resource to record when a Retrieve Document Transaction happens."
* type = http://dicom.nema.org/resources/ontology/DCM#110107 "Import"
* action = #C
* subtype = urn:ihe:event-type-code#ITI-68 "Retrieve Document"
// .source is already required to be populated - what agent detected the event usually one of the .agent systems sending or receiving
// .agent[0] holds system that sent the Request -- RoleIDCode[@code='110153']
// .agent[1] holds the system that responds to the request -- RoleIDCode[@code='110152']
// .agent[2] if known the human(s) who triggered -- not(RoleIDCode) or RoleIDCode[@code!='110153' and @code!='110152']
// .entity[0] holds the patient identity as included in the query parameters -- @ParticipantObjectTypeCode='1' and @ParticipantObjectTypeCodeRole='1'
// .entity[1] holds the document requested (URL) -- @ParticipantObjectTypeCode='2' and @ParticipantObjectTypeCodeRole='3'

Profile:        AuditRetrieveDocumentResponder
Parent:         AuditEvent
Id:             IHE.MHD.RetrieveDocument.Audit.Responder
Title:          "Audit Event for Retrieve Document Transaction"
Description:    "Defines constraints on the AuditEvent Resource to record when a Retrieve Document Transaction happens."
* type = http://dicom.nema.org/resources/ontology/DCM#110106 "Export"
* action = #R
* subtype = urn:ihe:event-type-code#ITI-68 "Retrieve Document"
// .source is already required to be populated - what agent detected the event usually one of the .agent systems sending or receiving
// .agent[0] holds system that sent the Request -- RoleIDCode[@code='110153']
// .agent[1] holds the system that responds to the request -- RoleIDCode[@code='110152']
// .agent[2] if known the human(s) who triggered -- not(RoleIDCode) or RoleIDCode[@code!='110153' and @code!='110152']
// .entity[0] holds the patient identity as included in the query parameters -- @ParticipantObjectTypeCode='1' and @ParticipantObjectTypeCodeRole='1'
// .entity[1] holds the document requested (URL) -- @ParticipantObjectTypeCode='2' and @ParticipantObjectTypeCodeRole='3'
