// Simple publication style ITI-65, one DocumentReference and the Document -- classic XDS static document


Instance: ex-response-comprehensiveProvideDocumentBundleSimple
InstanceOf: IHE.MHD.ProvideDocumentBundleResponse 
Title:      "Response to Provide Document Bundle with one document with sourcePatientInfo"
Description: """
Response bundle example given ex-comprehensiveProvideDocumentBundleSimple
- for every entry in order given
  - successful create of SubmissionSet
  - successful create of DocumentReference - classic XDS static document
  - successful create of Binary
"""
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




Instance:   ex-comprehensiveProvideDocumentBundleSimple
InstanceOf: IHE.MHD.Comprehensive.ProvideBundle
Title:      "Provide Document Bundle with Comprehensive metadata of one document"
Description: "Example of a comprehensive Provide Document Bundle for a publication.
- The bundle contains
  - SubmissionSet - identifies one documentReference
  - DocumentReference - One DocumentReference
  - Binary - the document
  - the Patient is contained in the DocumentReference
  - the Patient is also a reference to a PIXm/PDQm retrieved Resource."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #transaction
* timestamp = 2004-10-25T23:50:50-05:00
* entry[SubmissionSet].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00333300001"
* entry[SubmissionSet].resource = aaaaaaaa-bbbb-cccc-dddd-e00333300001
* entry[SubmissionSet].request.url = "List"
* entry[SubmissionSet].request.method = #POST
* entry[DocumentRefs].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00333300002"
* entry[DocumentRefs].resource = aaaaaaaa-bbbb-cccc-dddd-e00333300002
* entry[DocumentRefs].request.url = "DocumentReference"
* entry[DocumentRefs].request.method = #POST
* entry[Documents].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00333300003"
* entry[Documents].resource = aaaaaaaa-bbbb-cccc-dddd-e00333300003
* entry[Documents].request.url = "Binary"
* entry[Documents].request.method = #POST


Instance:   aaaaaaaa-bbbb-cccc-dddd-e00333300004
InstanceOf: Patient
Title:      "Dummy Patient example"
Description: "Dummy patient for push scenario, carried in containment for sourcePatientInfo. This content is preserved to hold the Patient information as it was known at publication time."
Usage: #inline
* name[+].family = "Schmidt"
* name[=].given = "Dee"
* identifier[+].system = "http://example.org/patients"
* identifier[=].value = "mrn-1234"



Instance:   aaaaaaaa-bbbb-cccc-dddd-e00333300001
InstanceOf: IHE.MHD.Comprehensive.SubmissionSet
Title:      "SubmissionSet for Comprehensive metadata in a bundle"
Description: "Example of a comprehensive submissionSet in List resource with an intended recipient used in a bundle."
Usage: #inline
* text.status = #extensions
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">SubmissionSet with Patient</div>"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier[+].system = "urn:ietf:rfc:3986"
* identifier[=].value = "urn:oid:1.2.129.6.58.92.88337.1"
* identifier[=].use = #official
* identifier[+].system = "http://example.org/documents"
* identifier[=].value = "23425234-23470-1"
* identifier[=].use = #usual
* status = #current
* mode = #working
* code = MHDlistTypes#submissionset
* date = 2004-10-25T23:50:50-05:00
* entry[+].item = Reference(urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00333300002)
* extension[sourceId].valueIdentifier.value = "urn:oid:1.2.3.4"
* subject = Reference(Patient/ex-patient)
* extension[designationType].valueCodeableConcept = http://snomed.info/sct#225728007


Instance:   aaaaaaaa-bbbb-cccc-dddd-e00333300002
InstanceOf: IHE.MHD.Comprehensive.DocumentReference
Title:      "DocumentReference for Comprehensive metadata"
Description: "Example of a comprehensive DocumentReference resource being used in a PUSH. This contains the Patient, thus equivilant of XDR/XDM use of sourcePatientInfo."
Usage: #inline
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.53432.348.12973.17740.34205.4355.50220.62012"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:7d5bb8ac-68ee-4926-85e7-b8aac8e1f09d"
* status = #current
* contained[+] = aaaaaaaa-bbbb-cccc-dddd-e00333300004
* context.sourcePatientInfo = Reference(aaaaaaaa-bbbb-cccc-dddd-e00333300004)
* subject = Reference(Patient/ex-patient)
* content.format = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode#urn:ihe:iti:xds-sd:text:2008
* content.attachment.url = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00333300003"
* content.attachment.contentType = #text/plain
* content.attachment.hash = "MGE0ZDU1YThkNzc4ZTUwMjJmYWI3MDE5NzdjNWQ4NDBiYmM0ODZkMA=="
* content.attachment.size = 11
* type = http://loinc.org#60591-5
* category = http://loinc.org#11369-6
* securityLabel = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#R
* context.facilityType = http://snomed.info/sct#82242000
* context.practiceSetting =  http://snomed.info/sct#408467006
* content.attachment.language = urn:ietf:bcp:47#en
* content.attachment.creation = 2020-02-01T23:50:50-05:00
* content.attachment.title = "Hello World"
* date = 2020-02-01T23:50:50-05:00


Instance: aaaaaaaa-bbbb-cccc-dddd-e00333300003
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

