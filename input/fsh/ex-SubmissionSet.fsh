Instance:   ex-minimalSubmissionSet
InstanceOf: IHE.MHD.Minimal.SubmissionSet
Title:      "SubmissionSet for Minimal metadata"
Description: "Example of a minimal submissionSet in List resource."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier[entryUUID].system = "urn:ietf:rfc:3986"
* identifier[entryUUID].value = "urn:uuid:40b3366f-7e4b-4d02-bbac-901aaa8d7183"
* identifier[entryUUID].use = #official
* identifier[uniqueId].system = "urn:ietf:rfc:3986"
* identifier[uniqueId].value = "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46354"
* identifier[uniqueId].use = #usual
* status = #current
* mode = #working
* code = MHDlistTypes#submissionset
* date = 2004-12-25T23:50:50-05:00
* entry[0].item = Reference(DocumentReference/ex-documentreference)
* extension[sourceId].valueIdentifier.value = "urn:oid:1.2.3.4"


Instance:   ex-compSubmissionSetList
InstanceOf: IHE.MHD.Comprehensive.SubmissionSet
Title: "Example Comprehensive SubmissionSet"
Description:      "SubmissionSet in List resource conforming minimally to Comprehensive metadata"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-patient)
* identifier[entryUUID].system = "urn:ietf:rfc:3986"
* identifier[entryUUID].value = "urn:uuid:340d303b-b889-4d44-b766-27f14c212236"
* identifier[entryUUID].use = #official
* identifier[uniqueId].system = "urn:ietf:rfc:3986"
* identifier[uniqueId].value = "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46355"
* identifier[uniqueId].use = #usual
* status = #current
* mode = #working
* title = "Example SubmissionSet for comprehensive metadata"
* code = MHDlistTypes#submissionset
* date = 2004-12-25T23:50:50-05:00
* entry[0].item = Reference(DocumentReference/ex-documentreference)
* entry[1].item = Reference(List/ex-list)
* extension[designationType].valueCodeableConcept = http://snomed.info/sct#225728007
* extension[sourceId].valueIdentifier.value = "urn:oid:1.2.3.4"

Instance:   ex-compEmailPackage
InstanceOf: IHE.MHD.Comprehensive.SubmissionSet
Title: "Example Comprehensive Email SubmissionSet"
Description:      "SubmissionSet in List resource conforming Comprehensive metadata with an intendedRecipient"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-patient)
* identifier[entryUUID].system = "urn:ietf:rfc:3986"
* identifier[entryUUID].value = "urn:uuid:1d136ed2-d27b-4353-8ccf-49581ab4ae66"
* identifier[entryUUID].use = #official
* identifier[uniqueId].system = "urn:ietf:rfc:3986"
* identifier[uniqueId].value = "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46356"
* identifier[uniqueId].use = #usual
* status = #current
* mode = #working
* title = "Example SubmissionSet for comprehensive metadata with an intendedRecipient"
* code = MHDlistTypes#submissionset
* date = 2004-12-25T23:50:50-05:00
* entry[0].item = Reference(DocumentReference/ex-documentreference)
* extension[designationType].valueCodeableConcept = http://snomed.info/sct#225728007
* extension[sourceId].valueIdentifier.value = "urn:oid:1.2.3.4"
* extension[intendedRecipient].valueReference = Reference(Practitioner/ex-practitioner)


Instance:   ex-compSubmissionSetFullUnContained
InstanceOf: IHE.MHD.UnContained.Comprehensive.SubmissionSet
Title: "Example UnContained Comprehensive Full SubmissionSet"
Description:      "SubmissionSet in List resource conforming fully to UnContained References Option and Comprehensive Metadata Option. This has all elements fully populated."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-patient)
* identifier[entryUUID].system = "urn:ietf:rfc:3986"
* identifier[entryUUID].value = "urn:uuid:479f69ae-4bb1-4cdb-97bd-80e2c9b85d01"
* identifier[entryUUID].use = #official
* identifier[uniqueId].system = "urn:ietf:rfc:3986"
* identifier[uniqueId].value = "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46357"
* identifier[uniqueId].use = #usual
* status = #current
* mode = #working
* title = "Example SubmissionSet for comprehensive metadata"
* code = MHDlistTypes#submissionset
* date = 2004-12-25T23:50:50-05:00
* entry[0].item = Reference(DocumentReference/ex-documentreference)
* entry[1].item = Reference(List/ex-list)
* extension[designationType].valueCodeableConcept = http://snomed.info/sct#225728007
* extension[sourceId].valueIdentifier.value = "urn:oid:1.2.3.4"
* extension[intendedRecipient].valueReference = Reference(Practitioner/ex-practitioner)
* source = Reference(ex-practitioner)

Instance:   ex-compSubmissionSetFull
InstanceOf: IHE.MHD.Minimal.SubmissionSet
Title: "Example Comprehensive Full SubmissionSet"
Description:      "SubmissionSet in List resource conforming fully to Comprehensive metadata. This has all elements fully populated."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-patient)
* identifier[entryUUID].system = "urn:ietf:rfc:3986"
* identifier[entryUUID].value = "urn:uuid:2158bc9d-3d34-4503-9253-1e0383f828ff"
* identifier[entryUUID].use = #official
* identifier[uniqueId].system = "urn:ietf:rfc:3986"
* identifier[uniqueId].value = "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46358"
* identifier[uniqueId].use = #usual
* status = #current
* mode = #working
* title = "Example SubmissionSet for comprehensive metadata"
* code = MHDlistTypes#submissionset
* date = 2004-12-25T23:50:50-05:00
* entry[0].item = Reference(DocumentReference/ex-documentreference)
* entry[1].item = Reference(List/ex-list)
* contained[0] = in-sender
* source = Reference(in-sender)
* source.extension[AuthorOrg].valueReference = Reference(Organization/ex-organization)
* extension[designationType].valueCodeableConcept = http://snomed.info/sct#225728007
* extension[sourceId].valueIdentifier.value = "urn:oid:1.2.3.4"
* extension[intendedRecipient].valueReference = Reference(ex-practitioner)


Instance: in-sender
InstanceOf: Practitioner
Usage: #inline
* telecom.system = #email
* telecom.value = "JohnMoehrke@gmail.com"

// do not include examples of search set as there are problems with the IG builder
