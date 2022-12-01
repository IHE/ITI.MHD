Profile:        AuditSimplifiedPublishRecipient
Parent:         IHE.BasicAudit.PatientCreate
Id:             IHE.MHD.SimplifiedPublish.Audit.Recipient
Title:          "Audit Event for Simplified Publish ITI-105 Transaction at Recipient"
Description:    """
Defines constraints on the AuditEvent Resource to record when a Simplified Publish ITI-105 Transaction happens at the Recipient.
- Build off of the IHE Basic Audit Patient Create event
- add the ITI-105 as a subtype
- client is the Document Source
- Server is the Document Recipient
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have a documentReference identity entity
"""
* modifierExtension 0..0
* subtype 2..
* subtype contains iti105 1..1
* subtype[iti105] = urn:ihe:event-type-code#ITI-105 "Simplified Publish"
* agent[server] obeys val-audit-source
* agent[client] ^short = "Document Source"
* agent[server] ^short = "Document Recipient"
* entity[patient] ^short = "Patient"
* entity[data] ^short = "DocumentReference"
* entity[data].what only Reference(DocumentReference)
// no good way to express that the Binary could also be indicated
//* entity contains binary 0..1
//* entity[binary] ^short = "May indicate the extracted Binary"
//* entity[binary].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
//* entity[binary].role from RestObjectRoles (required)
//* entity[binary].what 1..1
//* entity[binary].what only Reference(Binary)



Profile:        AuditSimplifiedPublishSource
Parent:         IHE.BasicAudit.PatientCreate
Id:             IHE.MHD.SimplifiedPublish.Audit.Source
Title:          "Audit Event for Simplified Publish ITI-105 Transaction at Source"
Description:    """
Defines constraints on the AuditEvent Resource to record when a Simplified Publish ITI-105 Transaction happens at the Soure.
- Build off of the IHE Basic Audit Patient Create event
- add the ITI-105 as a subtype
- client is the Document Source
- Server is the Document Recipient
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have a documentReference identity entity
"""
* modifierExtension 0..0
* subtype 2..
* subtype contains iti105 1..1
* subtype[iti105] = urn:ihe:event-type-code#ITI-105 "Simplified Publish"
* agent[client] obeys val-audit-source
* agent[client] ^short = "Document Source"
* agent[server] ^short = "Document Recipient"
* entity[patient] ^short = "Patient"
* entity[data] ^short = "DocumentReference"
* entity[data].what only Reference(DocumentReference)

