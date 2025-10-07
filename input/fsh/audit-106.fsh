Profile:        AuditGenerateMetadataRecipient
Parent:         IHE.BasicAudit.MHD5.PatientCreate
Id:             IHE.MHD.GenerateMetadata.Audit.Recipient
Title:          "Audit Event for Generate Metadata ITI-106 Transaction at Recipient"
Description:    """
Defines constraints on the AuditEvent Resource to record when a Generate Metadata ITI-106 Transaction happens at the Recipient.
- Build off of the IHE Basic Audit Patient Create event
- add the ITI-106 as a subtype
- client is the Document Source
- Server is the Document Recipient
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have a documentReference identity entity
"""
* modifierExtension 0..0
* category 2..
* category contains iti106 1..1
* category[iti106] = urn:ihe:event-type-code#ITI-106 "Generate Metadata"
* agent[server] obeys val-audit-source
* agent[client] ^short = "Document Source"
* agent[server] ^short = "Document Recipient"
* entity[patient] ^short = "Patient"
* entity[data] ^short = "DocumentReference"
* entity[data].what only Reference(DocumentReference)


Profile:        AuditGenerateMetadataSource
Parent:         IHE.BasicAudit.MHD5.Create
Id:             IHE.MHD.GenerateMetadata.Audit.Source
Title:          "Audit Event for Generate Metadata ITI-106 Transaction at Source"
Description:    """
Defines constraints on the AuditEvent Resource to record when a Generate Metadata ITI-106 Transaction happens at the Soure.
- Build off of the IHE Basic Audit Create event
- add the ITI-106 as a subtype
- client is the Document Source
- Server is the Document Recipient
- may have user, app, organization agent(s)
- shall have a document uri
- note the Document Source may add a patient if it knows it.
"""
* modifierExtension 0..0
* category 2..
* category contains iti106 1..1
* category[iti106] = urn:ihe:event-type-code#ITI-106 "Generate Metadata"
* agent[client] obeys val-audit-source
* agent[client] ^short = "Document Source"
* agent[server] ^short = "Document Recipient"
* entity[data] ^short = "document"

