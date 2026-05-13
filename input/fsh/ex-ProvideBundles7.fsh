// Add a new document to an existing Folder
// note did not include responses for all of these

Instance:   ex-ProvideDocumentBundle-addToFolder
InstanceOf: IHE.MHD.Comprehensive.ProvideBundle
Title:      "Provide Document Bundle with one document to be added to an existing folder"
Description: "Example of a comprehensive Provide Document Bundle for a publication and added to an existing folder.
- The bundle contains
  - SubmissionSet - identifies one documentReference
  - Folder - existing Folder to be updated
  - DocumentReference - One DocumentReference
  - Binary - the document
  - the Patient is contained in the DocumentReference
  - the Patient is also a reference to a PIXm/PDQm retrieved Resource."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #transaction
* timestamp = 2004-10-25T23:50:50-05:00
* entry[SubmissionSet].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00777700001"
* entry[SubmissionSet].resource = aaaaaaaa-bbbb-cccc-dddd-e00777700001
* entry[SubmissionSet].request.url = "List"
* entry[SubmissionSet].request.method = #POST
* entry[Folders].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00777700005"
* entry[Folders].resource = aaaaaaaa-bbbb-cccc-dddd-e00777700005
* entry[Folders].request.url = "List"
* entry[Folders].request.method = #PUT
* entry[DocumentRefs].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00777700002"
* entry[DocumentRefs].resource = aaaaaaaa-bbbb-cccc-dddd-e00777700002
* entry[DocumentRefs].request.url = "DocumentReference"
* entry[DocumentRefs].request.method = #POST
* entry[Documents].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00777700003"
* entry[Documents].resource = aaaaaaaa-bbbb-cccc-dddd-e00777700003
* entry[Documents].request.url = "Binary"
* entry[Documents].request.method = #POST


Instance:   aaaaaaaa-bbbb-cccc-dddd-e00777700004
InstanceOf: Patient
Title:      "Dummy Patient example"
Description: "Dummy patient for push scenario, carried in containment for sourcePatientInfo. This content is preserved to hold the Patient information as it was known at publication time."
Usage: #inline
* name[+].family = "Schmidt"
* name[=].given = "Dee"
* identifier[+].system = "http://example.org/patients"
* identifier[=].value = "mrn-1234"



Instance:   aaaaaaaa-bbbb-cccc-dddd-e00777700001
InstanceOf: IHE.MHD.Comprehensive.SubmissionSet
Title:      "SubmissionSet for Comprehensive metadata in a bundle"
Description: "Example of a comprehensive submissionSet in List resource with an intended recipient used in a bundle."
Usage: #inline
* text.status = #extensions
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">SubmissionSet with Patient</div>"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier[uniqueId].system = "urn:ietf:rfc:3986"
* identifier[uniqueId].value = "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46352"
* identifier[uniqueId].use = #usual
* status = #current
* mode = #working
* code = MHDlistTypes#submissionset
* date = 2004-10-25T23:50:50-05:00
* entry[+].item = Reference(urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00777700002)
* entry[+].item = Reference(urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00777700005)
* extension[sourceId].valueIdentifier.value = "urn:oid:1.2.3.4"
* subject = Reference(Patient/ex-patient)
* extension[designationType].valueCodeableConcept = http://snomed.info/sct#225728007


Instance:   aaaaaaaa-bbbb-cccc-dddd-e00777700002
InstanceOf: IHE.MHD.Comprehensive.DocumentReference
Title:      "DocumentReference for Comprehensive metadata"
Description: "Example of a comprehensive DocumentReference resource being used in a PUSH. This contains the Patient, thus equivilant of XDR/XDM use of sourcePatientInfo."
Usage: #inline
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.53432.348.12973.17740.34205.4355.50220.62012"
* status = #current
* contained[+] = aaaaaaaa-bbbb-cccc-dddd-e00777700004
* context.sourcePatientInfo = Reference(aaaaaaaa-bbbb-cccc-dddd-e00777700004)
* subject = Reference(Patient/ex-patient)
* content.format = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode#urn:ihe:iti:xds-sd:text:2008
* content.attachment.url = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00777700003"
* content.attachment.contentType = #text/plain
* content.attachment.hash = "Ck1VqNd45QIvq3AZd8XYQLvEhtA="
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


Instance: aaaaaaaa-bbbb-cccc-dddd-e00777700003
InstanceOf: Binary
Title: "Dummy Binary document that says: Hello World"
Description: """
For Bundling Example binary that 
- holds \"Hello World\"
- size 11
- hash 0a4d55a8d778e5022fab701977c5d840bbc486d0
- base64 of the hash Ck1VqNd45QIvq3AZd8XYQLvEhtA=
"""
Usage: #inline
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* contentType = #text/plain
* data = "SGVsbG8gV29ybGQ="

// the instance is simulating an existing
Instance:   aaaaaaaa-bbbb-cccc-dddd-e00777700005
InstanceOf: IHE.MHD.Comprehensive.Folder
Title: "Example complete Comprehensive Folder"
Description:      "Folder in List resource conforming Comprehensive metadata fully populated"
Usage: #inline
* text.status = #extensions
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Folder with Patient</div>"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-patient)
* identifier[uniqueId].system = "urn:ietf:rfc:3986"
* identifier[uniqueId].value = "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46353"
* identifier[uniqueId].use = #usual
* status = #current
* mode = #working
* title = "Example Folder with comprehensive metadata"
* code = MHDlistTypes#folder
* date = 2004-12-25T23:50:50-05:00
* entry[+].item = Reference(DocumentReference/ex-DocumentReferenceComprehensive)
// The only change from what exists is that this new entry is added
* entry[+].item = Reference(urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00777700002)
* extension[designationType][0].valueCodeableConcept = http://snomed.info/sct#225728007
* extension[designationType][1].valueCodeableConcept = http://snomed.info/sct#284548004
* note.text = "Folder for submission"
