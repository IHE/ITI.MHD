Profile:        AuditFindDocumentReferencesConsumer
Parent:         IHE.BasicAudit.PatientQuery
Id:             IHE.MHD.FindDocumentReferences.Audit.Consumer
Title:          "Audit Event for Find Document References Transaction at Document Consumer"
Description:    """
Defines constraints on the AuditEvent Resource to record when a Find Document References Transaction happens, as recorded by the Document Consumer.
- Build off of the IHE BasicAudit PatientQuery event
- add the ITI-67 as a subtype
- client is Document Consumer
- server is Document Responder
- entity slices for query, and patient are required
- entity slice for transaction is available
"""
* modifierExtension 0..0
* subtype 2..
* subtype contains iti67 1..1
* subtype[iti67] = urn:ihe:event-type-code#ITI-67 "Find Document References" (exactly)
* agent[client] obeys val-audit-source
* agent[client] ^short = "Document Consumer"
* agent[server] ^short = "Document Responder"
* entity[patient] ^short = "Patient"
* entity[query] ^short = "Search Parameters"



Profile:        AuditFindDocumentReferencesResponder
Parent:         IHE.BasicAudit.PatientQuery
Id:             IHE.MHD.FindDocumentReferences.Audit.Responder
Title:          "Audit Event for Find Document References Transaction at Document Responder"
Description:    """
Defines constraints on the AuditEvent Resource to record when a Find Document References Transaction happens, as recorded by the Document Responder.
- Build off of the IHE BasicAudit PatientQuery event
- add the ITI-67 as a subtype
- client is Document Consumer
- server is Document Responder
- entity slices for query, and patient are required
- entity slice for transaction is available"""
* modifierExtension 0..0
* subtype 2..
* subtype contains iti67 1..1
* subtype[iti67] = urn:ihe:event-type-code#ITI-67 "Find Document References" (exactly)
* agent[server] obeys val-audit-source
* agent[client] ^short = "Document Consumer"
* agent[server] ^short = "Document Responder"
* entity[patient] ^short = "Patient"
* entity[query] ^short = "Search Parameters"


