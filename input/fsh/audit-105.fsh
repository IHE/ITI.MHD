Profile:        AuditSimplifiedPublishRecipient
Parent:         AuditEvent
Id:             IHE.MHD.SimplifiedPublish.Audit.Recipient
Title:          "Audit Event for Simplified Publish Bundle Transaction at Recipient"
Description:    "Defines constraints on the AuditEvent Resource to record when a Simplified Publish Bundle Transaction happens at the Recipient.
- Import event
- shall have source of itself
- shall have a document source agent
- shall have a document recipient agent
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have a documentReference set identity entity"
* modifierExtension 0..0
* type = DCM#110107 "Import"
* action = #C
* subtype ^slicing.discriminator.type = #value
* subtype ^slicing.discriminator.path = "$this"
* subtype ^slicing.rules = #open // allow other codes
* subtype 1..
* subtype contains iti105 1..1
* subtype[iti105] = urn:ihe:event-type-code#ITI-105 "Simplified Publish Bundle" (exactly)
// * severity in R5
* recorded 1..1 // already required
* outcome 1..1
* outcomeDesc MS // encouraged
// source is already required, see invariant val-audit-source use
* agent 2..*
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent ^slicing.description = "source, recipient, and possibly the user who participated"
* agent contains 
	documentSource 1..1 and
	documentRecipient 1..1 
	// may be many including app identity, user identity, etc
* agent[documentSource].type = DCM#110153 "Source Role ID"
* agent[documentSource].who 1..1
* agent[documentSource].network 1..1
* agent[documentRecipient].type = DCM#110152 "Destination Role ID"
* agent[documentRecipient].who 1..1
* agent[documentRecipient] obeys val-audit-source
* agent[documentRecipient].network 1..1
* agent[documentSource] ^short = "Document Source"
* agent[documentRecipient] ^short = "Document Recipient"
* entity 2..2
* entity ^slicing.discriminator.type = #pattern
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #closed
* entity ^slicing.description = "patient and documetReference set involved"
* entity contains
	patient 1..1 and
	documentReference 1..1
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what 1..1
* entity[patient].what only Reference(Patient)
* entity[documentReference].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[documentReference].role = http://terminology.hl7.org/CodeSystem/object-role#20 "Job"
* entity[documentReference].what 1..1
* entity[documentReference].what only Reference(DocumentReference) 
* entity[patient] ^short = "Patient"
* entity[documentReference] ^short = "DocumentReference"



Profile:        AuditSimplifiedPublishSource
Parent:         AuditEvent
Id:             IHE.MHD.SimplifiedPublish.Audit.Source
Title:          "Audit Event for Simplified Publish Bundle Transaction at Source"
Description:    "Defines constraints on the AuditEvent Resource to record when a Simplified Publish Bundle Transaction happens at the Source.
- Import event
- shall have source of itself
- shall have a document source agent
- shall have a document recipient agent
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have a documentReference set identity entity"
* modifierExtension 0..0
* type = DCM#110106 "Export"
* action = #R
* subtype ^slicing.discriminator.type = #value
* subtype ^slicing.discriminator.path = "$this"
* subtype ^slicing.rules = #open // allow other codes
* subtype 1..
* subtype contains iti105 1..1
* subtype[iti105] = urn:ihe:event-type-code#ITI-105 "Simplified Publish Bundle" (exactly)
// * severity in R5
* recorded 1..1 // already required
* outcome 1..1
* outcomeDesc MS // encouraged
// source is already required, see invariant val-audit-source use
* agent 2..*
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent ^slicing.description = "source, recipient, and possibly the user who participated"
* agent contains 
	documentSource 1..1 and
	documentRecipient 1..1 
	// may be many including app identity, user identity, etc
* agent[documentSource].type = DCM#110153 "Source Role ID"
* agent[documentSource].who 1..1
* agent[documentSource] obeys val-audit-source
* agent[documentSource].network 1..1
* agent[documentRecipient].type = DCM#110152 "Destination Role ID"
* agent[documentRecipient].who 1..1
* agent[documentRecipient].network 1..1
* agent[documentSource] ^short = "Document Source"
* agent[documentRecipient] ^short = "Document Recipient"
* entity 2..2
* entity ^slicing.discriminator.type = #pattern
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #closed
* entity ^slicing.description = "patient and documentReference set involved"
* entity contains
	patient 1..1 and
	documentReference 1..1
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what 1..1
* entity[patient].what only Reference(Patient)
* entity[documentReference].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[documentReference].role = http://terminology.hl7.org/CodeSystem/object-role#20 "Job"
* entity[documentReference].what 1..1
* entity[documentReference].what only Reference(DocumentReference) 
* entity[patient] ^short = "Patient"
* entity[documentReference] ^short = "DocumentReference"

