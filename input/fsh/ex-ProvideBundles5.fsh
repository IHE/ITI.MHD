// Fully populated publication style ITI-65, one folder, one DocumentReference and the Document -- classic XDS static document


Instance: ex-response-comprehensiveProvideDocumentBundleComplete
InstanceOf: IHE.MHD.ProvideDocumentBundleResponse 
Title:      "Response to fully populated Provide Document Bundle with one document with sourcePatientInfo"
Description: """
Response bundle example given ex-comprehensiveProvideDocumentBundleComplete
- for every entry in order given
  - successful create of SubmissionSet
  - successful create of Folder
  - successful create of DocumentReference - classic XDS static document
  - successful create of Binary
"""
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #transaction-response
* link[0].relation = "self"
* link[0].url = "http://example.com/fhir"
* entry[+].response.status = "201 Created"
* entry[=].response.location = "List/501"
* entry[=].response.lastModified = "2020-10-05T11:56:15.094+00:00"
* entry[+].response.status = "201 Created"
* entry[=].response.location = "List/502"
* entry[=].response.lastModified = "2020-10-05T11:56:15.095+00:00"
* entry[+].response.status = "201 Created"
* entry[=].response.location = "DocumentReference/501"
* entry[=].response.lastModified = "2020-10-05T11:56:15.096+00:00"
* entry[+].response.status = "201 Created"
* entry[=].response.location = "Binary/501"
* entry[=].response.lastModified = "2020-10-05T11:56:15.097+00:00"




Instance:   ex-comprehensiveProvideDocumentBundleComplete
InstanceOf: IHE.MHD.Comprehensive.ProvideBundle
Title:      "Provide Document Bundle with complete Comprehensive metadata of one document"
Description: "Example of a complete comprehensive Provide Document Bundle for a publication.
- The bundle contains
  - SubmissionSet - identifies one documentReference
  - Folder - identifies one documentReference
  - DocumentReference - One DocumentReference
  - Binary - the document
  - the Patient is contained in the DocumentReference
  - the Patient is also a reference to a PIXm/PDQm retrieved Resource."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #transaction
* timestamp = 2004-10-05T11:50:50-05:00
* entry[SubmissionSet].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00555500001"
* entry[SubmissionSet].resource = aaaaaaaa-bbbb-cccc-dddd-e00555500001
* entry[SubmissionSet].request.url = "List"
* entry[SubmissionSet].request.method = #POST
* entry[Folders].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00555500004"
* entry[Folders].resource = aaaaaaaa-bbbb-cccc-dddd-e00555500004
* entry[Folders].request.url = "List"
* entry[Folders].request.method = #POST
* entry[DocumentRefs].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00555500002"
* entry[DocumentRefs].resource = aaaaaaaa-bbbb-cccc-dddd-e00555500002
* entry[DocumentRefs].request.url = "DocumentReference"
* entry[DocumentRefs].request.method = #POST
* entry[Documents].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00555500003"
* entry[Documents].resource = aaaaaaaa-bbbb-cccc-dddd-e00555500003
* entry[Documents].request.url = "Binary"
* entry[Documents].request.method = #POST


Instance:   in-patient5
InstanceOf: Patient
Title:      "Dummy Patient example"
Description: "Dummy patient for push scenario, carried in containment for sourcePatientInfo. This content is preserved to hold the Patient information as it was known at publication time."
Usage: #inline
* name[+].family = "Schmidt"
* name[=].given = "Dee"
* identifier[+].system = "http://example.org/patients"
* identifier[=].value = "mrn-1234"

Instance: in-practitionerAuthor
InstanceOf: Practitioner
Title: "Author Practitioner example"
Description: "a Practitioner identified only as an email address, carried as a contained resource."
Usage: #inline
* telecom.system = #email
* telecom.value = "iti@ihe.net"

Instance: in-practitionerRecipient
InstanceOf: Practitioner
Title: "Intended Practitioner Recipient example"
Description: "a Practitioner identified only as an email address, carried as a contained resource."
Usage: #inline
* telecom.system = #email
* telecom.value = "JohnMoehrke@gmail.com"

Instance: in-organizationAuthor
InstanceOf: Organization
Title: "Authoring Organization example"
Description: "An Organization identified as an author of content."
Usage: #inline
* name = "my Hospital"


Instance:   aaaaaaaa-bbbb-cccc-dddd-e00555500001
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
* entry[+].item = Reference(urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00555500002)
* entry[+].item = Reference(urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00555500004)
* extension[sourceId].valueIdentifier.value = "urn:oid:1.2.3.4"
// comprehensive mandates
* subject = Reference(Patient/ex-patient)
* extension[designationType].valueCodeableConcept = http://snomed.info/sct#225728007
// complete adds
* contained[+] = in-practitionerRecipient
* extension[intendedRecipient].valueReference = Reference(in-practitionerRecipient)
* title = "Hello World SubmissionSet"
* contained[+] = in-practitionerAuthor
* source = Reference(in-practitionerAuthor)
* contained[+] = in-organizationAuthor
* source.extension[AuthorOrg].valueReference = Reference(in-organizationAuthor)
* note.text = "Comments about Hello World SubmissionSet"


Instance:   aaaaaaaa-bbbb-cccc-dddd-e00555500002
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
* contained[+] = in-patient5
* context.sourcePatientInfo = Reference(in-patient5)
* subject = Reference(Patient/ex-patient)
* content.format = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode#urn:ihe:iti:xds-sd:text:2008
* content.attachment.url = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00555500003"
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
* contained[+] = in-organizationAuthor
* author[+] = Reference(in-organizationAuthor)
* contained[+] = in-practitionerAuthor
* author[+] = Reference(in-practitionerAuthor)
* authenticator[+] = Reference(in-organizationAuthor)
* relatesTo.code = #appends
* relatesTo.target = Reference(DocumentReference/ex-DocumentReferenceComprehensive)
* description = "a complete comprehensive metadata document reference"
* context.event = http://terminology.hl7.org/CodeSystem/v3-ActCode#PATDOC
* context.period.start = 1990-02-01T23:50:50-05:00
* context.period.end = 2020-02-01T23:50:50-05:00
* context.related.identifier.system =  "urn:ietf:rfc:3986"
* context.related.identifier.value = "urn:uuid:7d5bb8ac-68ee-4926-85e7-baaaaaaaaaad"


Instance: aaaaaaaa-bbbb-cccc-dddd-e00555500003
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


Instance:   aaaaaaaa-bbbb-cccc-dddd-e00555500004
InstanceOf: IHE.MHD.Comprehensive.Folder
Title: "Example complete Comprehensive Folder"
Description:      "Folder in List resource conforming Comprehensive metadata fully populated"
Usage: #inline
* text.status = #extensions
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Folder with Patient</div>"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-patient)
* identifier[0].system = "urn:ietf:rfc:3986"
* identifier[0].value = "urn:oid:1.2.129.6.58.92.88337.5"
* identifier[0].use = #official
* identifier[1].system = "http://example.org/documents"
* identifier[1].value = "23425234-23475"
* identifier[1].use = #usual
* status = #current
* mode = #working
* title = "Example Folder with comprehensive metadata"
* code = MHDlistTypes#folder
* date = 2004-12-25T23:50:50-05:00
* entry[+].item = Reference(urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00555500002)
* extension[designationType][0].valueCodeableConcept = http://snomed.info/sct#225728007
* extension[designationType][1].valueCodeableConcept = http://snomed.info/sct#284548004
* note.text = "Folder for submission"
