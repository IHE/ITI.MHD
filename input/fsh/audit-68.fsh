Profile:        AuditRetrieveDocumentConsumer
Parent:         AuditEvent
Id:             IHE.MHD.RetrieveDocument.Audit.Consumer
Title:          "Audit Event for Retrieve Document Transaction at Document Consumer"
Description:    "Defines constraints on the Document Consumer AuditEvent Resource to record when a Retrieve Document Transaction happens, as recorded by the Document Consumer.
- Import event
- shall have the source as itself
- shall have a document consumer agent
- shall have a document responder agent
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have a document uniqueId (usually a Binary)"
* modifierExtension 0..0
* type = DCM#110107 "Import"
* action = #C
* subtype = urn:ihe:event-type-code#ITI-68 "Retrieve Document"
// * severity in R5
* recorded 1..1 // already required
* outcome 1..1
* outcomeDesc MS // encouraged
// source is already required, see invariant val-audit-source use
* agent 2..*
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent ^slicing.description = "consumer, responder, and possibly the user who participated"
* agent contains 
	documentConsumer 1..1 and
	documentResponder 1..1 
	// may be many including app identity, user identity, etc
* agent[documentConsumer].type = DCM#110153 "Source Role ID"
* agent[documentConsumer].who 1..1
* agent[documentConsumer] obeys val-audit-source
* agent[documentConsumer].network 1..1
* agent[documentResponder].type = DCM#110152 "Destination Role ID"
* agent[documentResponder].who 1..1
* agent[documentResponder].network 1..1
* entity 2..2
* entity ^slicing.discriminator.type = #pattern
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #closed
* entity ^slicing.description = "patient and submission set involved"
* entity contains
	patient 1..1 and
	documentUniqueId 1..1
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what 1..1
* entity[patient].what only Reference(Patient)
* entity[documentUniqueId].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[documentUniqueId].role = http://terminology.hl7.org/CodeSystem/object-role#3 "Report"
* entity[documentUniqueId].what.reference 1..1 





Profile:        AuditRetrieveDocumentResponder
Parent:         AuditEvent
Id:             IHE.MHD.RetrieveDocument.Audit.Responder
Title:          "Audit Event for Retrieve Document Transaction at the Document Responder"
Description:    "Defines constraints on the Document Responder AuditEvent Resource to record when a Retrieve Document Transaction happens, as recorded by the Document Responder.
- Export event
- shall have the source as itself
- shall have a document consumer agent
- shall have a document responder agent
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have a document uniqueId (usually a Binary)"
* modifierExtension 0..0
* type = http://dicom.nema.org/resources/ontology/DCM#110106 "Export"
* action = #R
* subtype = urn:ihe:event-type-code#ITI-68 "Retrieve Document"
// * severity in R5
* recorded 1..1 // already required
* outcome 1..1
* outcomeDesc MS // encouraged
// source is already required, see invariant val-audit-source use
* agent 2..*
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent ^slicing.description = "consumer, responder, and possibly the user who participated"
* agent contains 
	documentConsumer 1..1 and
	documentResponder 1..1 
	// may be many including app identity, user identity, etc
* agent[documentConsumer].type = DCM#110153 "Source Role ID"
* agent[documentConsumer].who 1..1
* agent[documentConsumer].network 1..1
* agent[documentResponder].type = DCM#110152 "Destination Role ID"
* agent[documentResponder].who 1..1
* agent[documentResponder] obeys val-audit-source
* agent[documentResponder].network 1..1
* entity 2..2
* entity ^slicing.discriminator.type = #pattern
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #closed
* entity ^slicing.description = "patient and submission set involved"
* entity contains
	patient 1..1 and
	documentUniqueId 1..1
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what 1..1
* entity[patient].what only Reference(Patient)
* entity[documentUniqueId].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[documentUniqueId].role = http://terminology.hl7.org/CodeSystem/object-role#3 "Report"
* entity[documentUniqueId].what.reference 1..1 
