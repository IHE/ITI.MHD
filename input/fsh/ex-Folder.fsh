Instance:   ex-minimalFolder
InstanceOf: IHE.MHD.Minimal.Folder
Title: "Example Minimal Folder"
Description:      "Folder in List resource conforming only to Minimal metadata"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier[0].system = "urn:ietf:rfc:3986"
* identifier[0].value = "urn:oid:1.2.129.6.58.92.88337.6"
* identifier[0].use = #official
* identifier[1].system = "http://example.org/documents"
* identifier[1].value = "23425234-23476"
* identifier[1].use = #usual
* status = #current
* mode = #working
* code = MHDlistTypes#folder
* entry[0].item = Reference(DocumentReference/ex-documentreference)


Instance:   ex-compFolder
InstanceOf: IHE.MHD.Comprehensive.Folder
Title: "Example Comprehensive Folder"
Description:      "Folder in List resource conforming only to Comprehensive metadata"
Usage: #example
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
* entry[0].item = Reference(DocumentReference/ex-documentreference)
* entry[1].item = Reference(DocumentReference/ex-documentreference2)
* extension[designationType][0].valueCodeableConcept = http://snomed.info/sct#225728007
* extension[designationType][1].valueCodeableConcept = http://snomed.info/sct#284548004




// only include an example of a minimal FindDocumentLists as the IG builder crashes when I get more complete

Instance:   ex-findDocumentListsResponse
InstanceOf: IHE.MHD.FindDocumentListsResponseMessage
Title:      "Example of a Find Document Lists Response Message with a folder"
Description: "Example of a Find Documents List Response Bundle witha folder"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #searchset
* link[0].relation = "self"
* link[0].url = "test.fhir.net/R4/fhir/List?patient=9876&code=folder&status=current&designationType=http://snomed.info/sct#225728007"
* total = 1
* timestamp = 2021-04-16T11:32:24Z
* entry[0].fullUrl = "http://example.org/List/in-minimalFolder"
* entry[0].resource = in-minimalFolder

Instance:   in-minimalFolder
InstanceOf: IHE.MHD.Minimal.Folder
Title: "Example Minimal Folder"
Description:      "Folder in List resource conforming only to Minimal metadata"
Usage: #inline
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier[0].system = "urn:ietf:rfc:3986"
* identifier[0].value = "urn:oid:1.2.129.6.58.92.88337.6"
* identifier[0].use = #official
* identifier[1].system = "http://example.org/documents"
* identifier[1].value = "23425234-23476"
* identifier[1].use = #usual
* status = #current
* mode = #working
* code = MHDlistTypes#folder
* entry[0].item = Reference(DocumentReference/ex-documentreference)
