// Simple PUSH style ITI-65, with a intended recipient email, one DocumentReference and the Document, also carrying the Patient resource


Instance: ex-response-minimalProvideDocumentBundleSimple
InstanceOf: IHE.MHD.ProvideDocumentBundleResponse 
Title:      "Response to Provide Document Bundle with Minimal metadata of one document"
Description: "Response bundle example given ex-minimalProvideDocumentBundleSimple
- for every entry in order given
  - successful create of SubmissionSet
  - successful create of DocumentReference
  - successful create of Binary
  - successful create of Patient

Note that in the case of the Patient, it is likely this successful create is just a fake success, as it was more likely to have been matched to a patient that already existed and THAT id was returned. (Alternative could have been a 303)"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #transaction-response
* link[0].relation = "self"
* link[0].url = "http://example.com/fhir"
* entry[+].response.status = "201 Created"
* entry[=].response.location = "List/1"
* entry[=].response.lastModified = "2020-10-02T11:56:15.094+00:00"
* entry[+].response.status = "201 Created"
* entry[=].response.location = "DocumentReference/1"
* entry[=].response.lastModified = "2020-10-02T11:56:15.095+00:00"
* entry[+].response.status = "201 Created"
* entry[=].response.location = "Binary/1"
* entry[=].response.lastModified = "2020-10-02T11:56:15.096+00:00"
* entry[+].response.status = "201 Created"
* entry[=].response.location = "Patient/2"
* entry[=].response.lastModified = "2020-10-02T11:56:15.097+00:00"


Instance:   ex-minimalProvideDocumentBundleSimple
InstanceOf: IHE.MHD.Minimal.ProvideBundle
Title:      "Provide Document Bundle with Minimal metadata of one document"
Description: "Example of a minimal Provide Document Bundle for a push to an email intended recipient.
- The bundle contains
  - SubmissionSet - identifies to whom this is going and one documentReference
  - DocumentReference - One DocumentReference
  - Binary - the document
  - the Patient, as this is a push to a recipient that does not share a patient directory"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #transaction
* timestamp = 2004-10-25T23:50:50-05:00
* entry[SubmissionSet].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00111100001"
* entry[SubmissionSet].resource = aaaaaaaa-bbbb-cccc-dddd-e00111100001
* entry[SubmissionSet].request.url = "List"
* entry[SubmissionSet].request.method = #POST
* entry[DocumentRefs].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00111100002"
* entry[DocumentRefs].resource = aaaaaaaa-bbbb-cccc-dddd-e00111100002
* entry[DocumentRefs].request.url = "DocumentReference"
* entry[DocumentRefs].request.method = #POST
* entry[Documents].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00111100003"
* entry[Documents].resource = aaaaaaaa-bbbb-cccc-dddd-e00111100003
* entry[Documents].request.url = "Binary"
* entry[Documents].request.method = #POST
* entry[Patient].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00111100004"
* entry[Patient].resource = aaaaaaaa-bbbb-cccc-dddd-e00111100004
* entry[Patient].request.url = "Patient"
* entry[Patient].request.method = #POST

Instance:   aaaaaaaa-bbbb-cccc-dddd-e00111100004
InstanceOf: Patient
Title:      "Dummy Patient example"
Description: "Dummy patient for push scenario, carried in the Bundle."
Usage: #inline
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* name[+].family = "Schmidt"
* name[=].given = "Dee"

Instance: in-practitioner
InstanceOf: Practitioner
Title: "Intended Practitioner Recipient example"
Description: "a Practitioner identified only as an email address, carried as a contained resoruce."
Usage: #inline
* telecom.system = #email
* telecom.value = "JohnMoehrke@gmail.com"



Instance:   aaaaaaaa-bbbb-cccc-dddd-e00111100001
InstanceOf: IHE.MHD.Minimal.SubmissionSet
Title:      "SubmissionSet for Minimal metadata in a bundle"
Description: "Example of a minimal submissionSet in List resource with an intended recipient used in a bundle."
Usage: #inline
* text.status = #extensions
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">SubmissionSet with Patient</div>"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier[uniqueId].system = "urn:ietf:rfc:3986"
* identifier[uniqueId].value = "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46343"
* identifier[uniqueId].use = #usual
* status = #current
* mode = #working
* code = MHDlistTypes#submissionset
* date = 2004-10-25T23:50:50-05:00
* subject = Reference(urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00111100004)
* entry[+].item = Reference(urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00111100002)
* extension[sourceId].valueIdentifier.value = "urn:oid:1.2.3.4"
* contained[0] = in-practitioner2
* extension[intendedRecipient].valueReference = Reference(in-practitioner2)


Instance:   aaaaaaaa-bbbb-cccc-dddd-e00111100002
InstanceOf: IHE.MHD.Minimal.DocumentReference
Title:      "DocumentReference for Minimal metadata"
Description: "Example of a minimal DocumentReference resource. This points at a Binary also in the bundle."
Usage: #inline
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.53432.348.12973.17740.34205.4355.50220.62012"
* status = #current
* subject = Reference(urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00111100004)
* content.format = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode#urn:ihe:iti:xds-sd:text:2008
* content.attachment.url = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00111100003"
* content.attachment.contentType = #text/plain
* content.attachment.hash = "MGE0ZDU1YThkNzc4ZTUwMjJmYWI3MDE5NzdjNWQ4NDBiYmM0ODZkMA=="
* content.attachment.size = 11

Instance: aaaaaaaa-bbbb-cccc-dddd-e00111100003
InstanceOf: Binary
Title: "Dummy Binary document that says: Hello World"
Description: """
For Bundling Example binary that 
- holds \"Hello World\"
- size 11
- hash 0a4d55a8d778e5022fab701977c5d840bbc486d0
- base64 of the hash MGE0ZDU1YThkNzc4ZTUwMjJmYWI3MDE5NzdjNWQ4NDBiYmM0ODZkMA==
"""
Usage: #inline
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* contentType = #text/plain
* data = "SGVsbG8gV29ybGQ="

