//TODO - I could not figure out how to get the .subject elements to be populated. Neither to a Patient in the bundle, or absolute.

Instance:   ex-minimalProvideDocumentBundle
InstanceOf: IHE.MHD.Minimal.ProvideBundle
Title:      "Provide Document Bundle with Minimal metadata"
Description: "Example of a minimal Provide Document Bundle.
- The bundle contains
  - SubmissionSet - The SubmissionSet that identifies the Folder and DocumentReference
  - Folder - One Folder
  - DocumentReference - One DocumentReference
  - no Binary, as the DocumentReference has URL pointing at the document
  - Patient - Includes the Patient to enable recipient of PUSH to understand the intended Patient"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #transaction
* timestamp = 2020-11-24T23:50:50-05:00
* entry[SubmissionSet].fullUrl = "urn:uuid:593cd04e-b696-45c1-bc32-39e55a340a44"
* entry[SubmissionSet].resource = 593cd04e-b696-45c1-bc32-39e55a340a44
* entry[SubmissionSet].request.url = "List"
* entry[SubmissionSet].request.method = #POST
* entry[Folders].fullUrl = "urn:uuid:593cd04e-b696-45c1-bc32-39e55a340a45"
* entry[Folders].resource = 593cd04e-b696-45c1-bc32-39e55a340a45
* entry[Folders].request.url = "List"
* entry[Folders].request.method = #POST
* entry[DocumentRefs].fullUrl = "urn:uuid:593cd04e-b696-45c1-bc32-39e55a340a46"
* entry[DocumentRefs].resource = 593cd04e-b696-45c1-bc32-39e55a340a46
* entry[DocumentRefs].request.url = "DocumentReference"
* entry[DocumentRefs].request.method = #POST
* entry[Patient].fullUrl = "urn:uuid:593cd04e-b696-45c1-bc32-39e55a340a49"
* entry[Patient].resource = 593cd04e-b696-45c1-bc32-39e55a340a49
* entry[Patient].request.url = "Patient"
* entry[Patient].request.method = #POST

Instance:   593cd04e-b696-45c1-bc32-39e55a340a44
InstanceOf: IHE.MHD.Minimal.SubmissionSet
Title:      "SubmissionSet for Minimal metadata in a bundle"
Description: "Example of a minimal submissionSet in List resource used in a bundle."
Usage: #inline
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier[+].system = "urn:ietf:rfc:3986"
* identifier[=].value = "urn:oid:1.2.129.6.58.92.88337.5"
* identifier[=].use = #official
* identifier[+].system = "http://example.org/documents"
* identifier[=].value = "23425234-23470-5"
* identifier[=].use = #usual
* status = #current
* mode = #working
* code = MHDlistTypes#submissionset
* date = 2004-12-25T23:50:50-05:00
//* subject = Reference(urn:uuid:593cd04e-b696-45c1-bc32-39e55a340a49)
* entry[+].item = Reference(urn:uuid:593cd04e-b696-45c1-bc32-39e55a340a45)
* entry[+].item = Reference(urn:uuid:593cd04e-b696-45c1-bc32-39e55a340a46)
* extension[sourceId].valueIdentifier.value = "urn:oid:1.2.3.4"


Instance:   593cd04e-b696-45c1-bc32-39e55a340a46
InstanceOf: IHE.MHD.Minimal.DocumentReference
Title:      "DocumentReference for Minimal metadata"
Description: "Example of a minimal DocumentReference resource. This is very unlikely to be acceptable anywhere, but it is the minimum required."
Usage: #inline
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.53432.348.12973.17740.34205.4355.50220.62012"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:7d5bb8ac-68ee-4926-85e7-b8aac8e1f09d"
* status = #current
//* subject = Reference(urn:uuid:593cd04e-b696-45c1-bc32-39e55a340a49)
* content.attachment.contentType = #text/plain
* content.attachment.url = "http://example.com/nowhere.txt"

Instance:   593cd04e-b696-45c1-bc32-39e55a340a45
InstanceOf: IHE.MHD.Minimal.Folder
Title: "Example Minimal Folder"
Description:      "Folder in List resource conforming only to Minimal metadata"
Usage: #inline
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier[+].system = "urn:ietf:rfc:3986"
* identifier[=].value = "urn:oid:1.2.129.6.58.92.88337.4"
* identifier[=].use = #official
* identifier[+].system = "http://example.org/documents"
* identifier[=].value = "23425234-23470"
* identifier[=].use = #usual
* status = #current
* mode = #working
* code = MHDlistTypes#folder
//* subject = Reference(urn:uuid:593cd04e-b696-45c1-bc32-39e55a340a49)
* entry[+].item = Reference(urn:uuid:593cd04e-b696-45c1-bc32-39e55a340a46)

Instance:   593cd04e-b696-45c1-bc32-39e55a340a49
InstanceOf: Patient
Title:      "Dummy Patient example"
Description: "Dummy patient example for completeness sake. No actual use of this resource other than an example target"
Usage: #inline
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST

Instance:   593cd04e-b696-45c1-bc32-39e55a340a47
InstanceOf: IHE.MHD.Minimal.DocumentReference
Title:      "DocumentReference for Minimal metadata"
Description: "Example of a minimal DocumentReference resource. This is very unlikely to be acceptable anywhere, but it is the minimum required."
Usage: #inline
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.53432.348.12973.17740.34205.4355.50220.62012"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:7d5bb8ac-68ee-4926-85e7-b8aac8e1f09d"
* status = #current
//* subject = "http://example.org/fhir/Patient/ex-patient"
* content.attachment.contentType = #text/plain
* content.attachment.url = "http://example.com/nowhere.txt"

Instance: ex-ProvideDocumentBundleResponse
InstanceOf: IHE.MHD.Minimal.ProvideDocumentBundleResponse 
Title: "ex-ProvideDocumentBundleResponse"
Description: "IHE.MHD.Minimal.ProvideDocumentBundleResponse"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #transaction-response
* link[0].relation = "self"
* link[0].url = "http://example.com/fhir"
* entry[+].response.status = "201 Created"
* entry[=].response.location = "http://example.com/xdsretrieve?uniqueId=1.3.6.1.4.1.12559.11.13.2.1.2964&repositoryUniqueId=1.1.4567332.1.2"
* entry[=].response.lastModified = "2020-10-02T11:56:15.094+00:00"
* entry[+].response.status = "201 Created"
* entry[=].response.location = "List/68a928c0-df48-4743-a291-bfb0609bbddc"
* entry[=].response.lastModified = "2020-10-02T11:56:15.094+00:00"
* entry[+].response.status = "201 Created"
* entry[=].response.location = "DocumentReference/50383ae5-49e5-4dea-b0e6-660cb9e7b91f"
* entry[=].response.lastModified = "2020-10-02T11:56:15.101+00:00"


Instance:   ex-minimalProvideDocumentBundle2
InstanceOf: IHE.MHD.Minimal.ProvideBundle
Title:      "Provide Document Bundle with Minimal metadata 2"
Description: "Example of a minimal Provide Document Bundle. 
- with 2 document reference."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #transaction
* timestamp = 2020-11-24T23:50:50-05:00
* entry[SubmissionSet].fullUrl = "urn:uuid:593cd04e-b696-45c1-bc32-39e55a340a54"
* entry[SubmissionSet].resource = 593cd04e-b696-45c1-bc32-39e55a340a54
* entry[SubmissionSet].request.url = "List"
* entry[SubmissionSet].request.method = #POST
//* entry[DocumentRefs][+].fullUrl = "urn:uuid:593cd04e-b696-45c1-bc32-39e55a340a46"
//* entry[DocumentRefs][=].resource = 593cd04e-b696-45c1-bc32-39e55a340a46
//* entry[DocumentRefs][=].request.url = "DocumentReference"
//* entry[DocumentRefs][=].request.method = #POST
* entry[DocumentRefs][+].fullUrl = "urn:uuid:593cd04e-b696-45c1-bc32-39e55a340a47"
* entry[DocumentRefs][=].resource = 593cd04e-b696-45c1-bc32-39e55a340a47
* entry[DocumentRefs][=].request.url = "DocumentReference"
* entry[DocumentRefs][=].request.method = #POST

Instance:   593cd04e-b696-45c1-bc32-39e55a340a54
InstanceOf: IHE.MHD.Minimal.SubmissionSet
Title:      "SubmissionSet for Minimal metadata in a bundle"
Description: "Example of a minimal submissionSet in List resource used in a bundle."
Usage: #inline
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier[+].system = "urn:ietf:rfc:3986"
* identifier[=].value = "urn:oid:1.2.129.6.58.92.88337.5"
* identifier[=].use = #official
* identifier[+].system = "http://example.org/documents"
* identifier[=].value = "23425234-23470-5"
* identifier[=].use = #usual
* status = #current
* mode = #working
* code = MHDlistTypes#submissionset
* date = 2004-12-25T23:50:50-05:00
//* subject.reference = "http://example.org/fhir/Patient/ex-patient"
//* subject = Reference(Patient/ex-patient)
//* entry[+].item = Reference(urn:uuid:593cd04e-b696-45c1-bc32-39e55a340a46)
* entry[+].item = Reference(urn:uuid:593cd04e-b696-45c1-bc32-39e55a340a47)
* extension[sourceId].valueIdentifier.value = "urn:oid:1.2.3.4"


