// Fully populated publication style ITI-65, one folder, one DocumentReference and the Document -- classic XDS static document

// note this instance name is shortened because of the max length of 64 characters
Instance: ex-response-unContainedComprehensiveProvideDocumentBundleCompt
InstanceOf: IHE.MHD.ProvideDocumentBundleResponse 
Title:      "Response to fully populated Provide Document Bundle with one document with sourcePatientInfo"
Description: """
Response bundle example given ex-unContainedComprehensiveProvideDocumentBundleComplete
- for every entry in order given
  - successful create of SubmissionSet
  - successful create of DocumentReference - classic XDS static document
  - successful create of Binary
"""
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #transaction-response
* link[0].relation = #self
* link[0].url = "http://example.com/fhir"
* entry[+].response.status = "201 Created"
* entry[=].response.location = "List/501"
* entry[=].response.lastModified = "2020-10-05T11:56:15.094+00:00"
* entry[+].response.status = "201 Created"
* entry[=].response.location = "DocumentReference/501"
* entry[=].response.lastModified = "2020-10-05T11:56:15.096+00:00"
* entry[+].response.status = "201 Created"
* entry[=].response.location = "Binary/501"
* entry[=].response.lastModified = "2020-10-05T11:56:15.097+00:00"




Instance:   ex-unContainedComprehensiveProvideDocumentBundleComplete
InstanceOf: IHE.MHD.UnContained.Comprehensive.ProvideBundle
Title:      "Provide Document Bundle with complete UnContained Comprehensive metadata of one document"
Description: "Example of a complete uncontained comprehensive Provide Document Bundle for a publication.
- The bundle contains
  - SubmissionSet - identifies one documentReference
  - Folder - identifies one documentReference
  - DocumentReference - One DocumentReference
  - Binary - the document
  - the Practitioner and Organization are references
  - the Patient is also a reference to a PIXm/PDQm retrieved Resource."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #transaction
* timestamp = 2004-10-05T11:50:50-05:00
* entry[SubmissionSet].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00666600001"
* entry[SubmissionSet].resource = aaaaaaaa-bbbb-cccc-dddd-e00666600001
* entry[SubmissionSet].request.url = "List"
* entry[SubmissionSet].request.method = #POST
* entry[DocumentRefs].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00666600002"
* entry[DocumentRefs].resource = aaaaaaaa-bbbb-cccc-dddd-e00666600002
* entry[DocumentRefs].request.url = "DocumentReference"
* entry[DocumentRefs].request.method = #POST
* entry[Documents].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00666600003"
* entry[Documents].resource = aaaaaaaa-bbbb-cccc-dddd-e00666600003
* entry[Documents].request.url = "Binary"
* entry[Documents].request.method = #POST



Instance:   aaaaaaaa-bbbb-cccc-dddd-e00666600001
InstanceOf: IHE.MHD.UnContained.Comprehensive.SubmissionSet
Title:      "SubmissionSet for UnContained Comprehensive metadata in a bundle"
Description: "Example of a uncontained comprehensive submissionSet in List resource with an intended recipient used in a bundle."
Usage: #inline
* text.status = #extensions
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">SubmissionSet with Patient</div>"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier[uniqueId].system = "urn:ietf:rfc:3986"
* identifier[uniqueId].value = "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46351"
* identifier[uniqueId].use = #usual
* status = #current
* mode = #working
* code = MHDlistTypes#submissionset
* date = 2004-10-25T23:50:50-05:00
* entry[+].item = Reference(urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00666600002)
* extension[sourceId].valueIdentifier.value = "urn:oid:1.2.3.4"
// comprehensive mandates
* subject = Reference(Patient/ex-patient)
* extension[designationType].valueCodeableConcept = http://snomed.info/sct#225728007
// complete adds
* extension[intendedRecipient].valueReference = Reference(Practitioner/ex-practitioner)
* title = "Hello World SubmissionSet"
* source = Reference(Practitioner/ex-practitioner)
* source.extension[AuthorOrg].valueReference = Reference(Organization/ex-organization)
* note.text = "Comments about Hello World SubmissionSet"


Instance:   aaaaaaaa-bbbb-cccc-dddd-e00666600002
InstanceOf: IHE.MHD.UnContained.Comprehensive.DocumentReference
Title:      "DocumentReference for UnContained Comprehensive metadata"
Description: "Example of a comprehensive uncontained DocumentReference resource being used in a PUSH. This contains the Patient, thus equivilant of XDR/XDM use of sourcePatientInfo."
Usage: #inline
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier[uniqueId].system = "urn:ietf:rfc:3986"
* identifier[uniqueId].value = "urn:oid:1.2.840.113556.1.8000.2554.53432.348.12973.17740.34205.4355.50220.62012"
* status = #current
* subject = Reference(Patient/ex-patient)
* extension[sourcePatient].valueReference = Reference(Patient/ex-patient)
* content.profile.valueCoding = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode#urn:ihe:iti:xds-sd:text:2008
* content.attachment.url = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00666600003"
* content.attachment.contentType = #text/plain
* content.attachment.hash = "MGE0ZDU1YThkNzc4ZTUwMjJmYWI3MDE5NzdjNWQ4NDBiYmM0ODZkMA=="
* content.attachment.size = 11
* type = http://loinc.org#60591-5
* category = http://loinc.org#11369-6
* securityLabel = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#R
* facilityType = http://snomed.info/sct#82242000
* practiceSetting =  http://snomed.info/sct#408467006
* content.attachment.language = urn:ietf:bcp:47#en
* content.attachment.creation = 2020-02-01T23:50:50-05:00
* content.attachment.title = "Hello World"
* date = 2020-02-01T23:50:50-05:00
* author[+] = Reference(Organization/ex-organization)
* author[+] = Reference(Practitioner/ex-practitioner)
* attester[+].party = Reference(Organization/ex-organization)
* attester[=].mode = http://hl7.org/fhir/composition-attestation-mode#professional
* relatesTo.code = http://hl7.org/fhir/document-relationship-type#appends
* relatesTo.target = Reference(DocumentReference/ex-DocumentReferenceComprehensive)
* description = "a complete comprehensive metadata document reference"
* event.concept = http://terminology.hl7.org/CodeSystem/v3-ActCode#PATDOC
* period.start = 1990-02-01T23:50:50-05:00
* period.end = 2020-02-01T23:50:50-05:00
* event.reference.identifier.system =  "urn:ietf:rfc:3986"
* event.reference.identifier.value = "urn:uuid:7d5bb8ac-68ee-4926-85e7-baaaaaaaaaad"


Instance: aaaaaaaa-bbbb-cccc-dddd-e00666600003
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
