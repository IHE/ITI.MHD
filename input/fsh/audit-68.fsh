Profile:        AuditRetrieveDocumentConsumer
Parent:         IHE.BasicAudit.PatientRead
Id:             IHE.MHD.RetrieveDocument.Audit.Consumer
Title:          "Audit Event for Retrieve Document Transaction at Document Consumer"
Description:    """
Defines constraints on the Document Consumer AuditEvent Resource to record when a Retrieve Document Transaction happens, as recorded by the Document Consumer.
- Build off of the IHE BasicAudit PatientRead event
- add the ITI-68 as a subtype
- client is Document Consumer
- server is Document Responder
- entity slices for data, and patient are required
- entity slice for transaction is available
"""
* modifierExtension 0..0
* subtype 2..
* subtype contains iti68 1..1
* subtype[iti68] = urn:ihe:event-type-code#ITI-68 "Retrieve Document"
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#3 "Report"
* agent[client] obeys val-audit-source
* agent[client] ^short = "Document Consumer"
* agent[server] ^short = "Document Responder"
* entity[patient] ^short = "Patient"
* entity[data] ^short = "the data"






Profile:        AuditRetrieveDocumentResponder
Parent:         IHE.BasicAudit.PatientRead
Id:             IHE.MHD.RetrieveDocument.Audit.Responder
Title:          "Audit Event for Retrieve Document Transaction at the Document Responder"
Description:    """
Defines constraints on the Document Responder AuditEvent Resource to record when a Retrieve Document Transaction happens, as recorded by the Document Responder.
- Build off of the IHE BasicAudit PatientRead event
- add the ITI-68 as a subtype
- client is Document Consumer
- server is Document Responder
- entity slices for data, and patient are required
- entity slice for transaction is available
"""
* modifierExtension 0..0
* subtype 2..
* subtype contains iti68 1..1
* subtype[iti68] = urn:ihe:event-type-code#ITI-68 "Retrieve Document"
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#3 "Report"
* agent[server] obeys val-audit-source
* agent[client] ^short = "Document Consumer"
* agent[server] ^short = "Document Responder"
* entity[patient] ^short = "Patient"
* entity[data] ^short = "the data"
