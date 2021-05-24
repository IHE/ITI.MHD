Profile:        AuditProvideBundleRecipient
Parent:         AuditEvent
Id:             IHE.MHD.ProvideBundle.Audit.Recipient
Title:          "Audit Event for Provide Bundle Transaction at Recipient"
Description:    "Defines constraints on the AuditEvent Resource to record when a Provide Bundle Transaction happens at the Recipient.
- Import event
- shall have source of itself
- shall have a document source agent
- shall have a document recipient agent
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have a submission set identity entity"
* modifierExtension 0..0
* type = DCM#110107 "Import"
* action = #C
* subtype = urn:ihe:event-type-code#ITI-65 "Provide Document Bundle"
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
* entity 2..2
* entity ^slicing.discriminator.type = #pattern
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #closed
* entity ^slicing.description = "patient and submission set involved"
* entity contains
	patient 1..1 and
	submissionSet 1..1
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what 1..1
* entity[patient].what only Reference(Patient)
* entity[submissionSet].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[submissionSet].role = http://terminology.hl7.org/CodeSystem/object-role#20 "Job"
* entity[submissionSet].what 1..1
* entity[submissionSet].what only Reference(List) 

Invariant: val-audit-source
Description: "The Audit Source is this agent too."
Expression: "$this.who = %resource.source.observer"
Severity: #error

Profile:        AuditProvideBundleSource
Parent:         AuditEvent
Id:             IHE.MHD.ProvideBundle.Audit.Source
Title:          "Audit Event for Provide Bundle Transaction at Source"
Description:    "Defines constraints on the AuditEvent Resource to record when a Provide Bundle Transaction happens at the Source.
- Import event
- shall have source of itself
- shall have a document source agent
- shall have a document recipient agent
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have a submission set identity entity"
* modifierExtension 0..0
* type = DCM#110106 "Export"
* action = #R
* subtype = urn:ihe:event-type-code#ITI-65 "Provide Document Bundle"
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
* entity 2..2
* entity ^slicing.discriminator.type = #pattern
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #closed
* entity ^slicing.description = "patient and submission set involved"
* entity contains
	patient 1..1 and
	submissionSet 1..1
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what 1..1
* entity[patient].what only Reference(Patient)
* entity[submissionSet].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[submissionSet].role = http://terminology.hl7.org/CodeSystem/object-role#20 "Job"
* entity[submissionSet].what 1..1
* entity[submissionSet].what only Reference(List) 

