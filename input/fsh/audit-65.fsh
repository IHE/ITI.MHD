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
* code = DCM#110107 "Import"
* action = #C
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open // allow other codes
* category 1..
* category contains iti65 1..1
* category[iti65] = urn:ihe:event-type-code#ITI-65 "Provide Document Bundle"
// * severity in R5
* recorded 1..1 // already required
* outcome.code 1..1
* outcome.detail.text MS // encouraged
// source is already required, see invariant val-audit-source use
* agent 2..*
* agent ^slicing.discriminator.type = #value
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent ^slicing.description = "source, recipient, and possibly the user who participated"
* agent contains 
	documentSource 1..1 and
	documentRecipient 1..1 
	// may be many including app identity, user identity, etc
* agent[documentSource].type = DCM#110153 "Source Role ID"
* agent[documentSource].who 1..1
* agent[documentSource].network[x] 1..1
* agent[documentRecipient].type = DCM#110152 "Destination Role ID"
* agent[documentRecipient].who 1..1
* agent[documentRecipient] obeys val-audit-source
* agent[documentRecipient].network[x] 1..1
* agent[documentSource] ^short = "Document Source"
* agent[documentRecipient] ^short = "Document Recipient"
* entity 2..
* entity ^slicing.discriminator.type = #value
* entity ^slicing.discriminator.path = "role"
* entity ^slicing.rules = #open
* entity ^slicing.description = "patient and submission set involved"
* entity contains
	patient 1..1 and
	submissionSet 1..1
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what 1..1
* entity[patient].what only Reference(Patient)
* entity[submissionSet].role = http://terminology.hl7.org/CodeSystem/object-role#20 "Job"
* entity[submissionSet].what 1..1
* entity[submissionSet].what only Reference(List) 
* entity[patient] ^short = "Patient"
* entity[submissionSet] ^short = "SubmissionSet"

Invariant: val-audit-source
Description: "The Audit Source is this agent too."
Expression: "$this.who = %resource.source.observer"
Severity: #error

Profile:        AuditProvideBundleSource
Parent:         AuditEvent
Id:             IHE.MHD.ProvideBundle.Audit.Source
Title:          "Audit Event for Provide Bundle Transaction at Source"
Description:    "Defines constraints on the AuditEvent Resource to record when a Provide Bundle Transaction happens at the Source.
- Export event
- shall have source of itself
- shall have a document source agent
- shall have a document recipient agent
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have a submission set identity entity"
* modifierExtension 0..0
* code = DCM#110106 "Export"
* action = #R
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open // allow other codes
* category 1..
* category contains iti65 1..1
* category[iti65] = urn:ihe:event-type-code#ITI-65 "Provide Document Bundle"
// * severity in R5
* recorded 1..1 // already required
* outcome.code 1..1
* outcome.detail.text MS // encouraged
// source is already required, see invariant val-audit-source use
* agent 2..*
* agent ^slicing.discriminator.type = #value
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
* agent[documentSource].network[x] 1..1
* agent[documentRecipient].type = DCM#110152 "Destination Role ID"
* agent[documentRecipient].who 1..1
* agent[documentRecipient].network[x] 1..1
* agent[documentSource] ^short = "Document Source"
* agent[documentRecipient] ^short = "Document Recipient"
* entity 2..
* entity ^slicing.discriminator.type = #value
* entity ^slicing.discriminator.path = "role"
* entity ^slicing.rules = #open
* entity ^slicing.description = "patient and submission set involved"
* entity contains
	patient 1..1 and
	submissionSet 1..1
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what 1..1
* entity[patient].what only Reference(Patient)
* entity[submissionSet].role = http://terminology.hl7.org/CodeSystem/object-role#20 "Job"
* entity[submissionSet].what 1..1
* entity[submissionSet].what only Reference(List) 
* entity[patient] ^short = "Patient"
* entity[submissionSet] ^short = "SubmissionSet"

CodeSystem: BasicAuditEntityType
Title: "Entity Types that are defined in IHE BasicAudit"
Description: """
These are new codes used in BasicAudit IG, where AuditEvent.entity is used to hold a specific kind of data that is not covered by the existing valueSet.
"""
* ^caseSensitive = true
* ^experimental = false
* #XrequestId "transport specific unique identifier where http X-Request-Id is used"



ValueSet: BasicAuditEntityTypesVS
Title: "Entity Types used by IHE BasicAudit"
Description: """
For use with AuditEvent.entity.type.  This includes codes defined in the BasicAudit.
"""
* ^experimental = false
* codes from system BasicAuditEntityType
