Instance:   ex-minimalSubmissionSet
InstanceOf: IHE.MHD.Minimal.SubmissionSet
Title:      "SubmissionSet for Minimal metadata"
Description: "Example of a minimal submissionSet in List resource. "
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier[0].system = "urn:ietf:rfc:3986"
* identifier[0].value = "urn:oid:1.2.129.6.58.92.88337.4"
* identifier[0].use = #official
* identifier[1].system = "http://example.org/documents"
* identifier[1].value = "23425234-23470"
* identifier[1].use = #usual
* status = #current
* mode = #working
* code = MHDlistTypes#submissionset
* date = 2004-12-25T23:50:50-05:00
* entry[0].item = Reference(DocumentReference/ex-documentreference)
* extension[sourceId].valueIdentifier.value = "urn:oid:1.2.3.4"


Instance:   ex-compSubmissionSetList
InstanceOf: IHE.MHD.Comprehensive.SubmissionSet
Title: "Example Comprehensive SubmissionSet"
Description:      "SubmissionSet in List resource conforming only to Comprehensive metadata"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-patient)
* identifier[0].system = "urn:ietf:rfc:3986"
* identifier[0].value = "urn:oid:1.2.129.6.58.92.88337.4"
* identifier[0].use = #official
* identifier[1].system = "http://example.org/documents"
* identifier[1].value = "23425234-23470"
* identifier[1].use = #usual
* status = #current
* mode = #working
* title = "Example SubmissionSet for comprehensive metadata"
* code = MHDlistTypes#submissionset
* date = 2004-12-25T23:50:50-05:00
* entry[0].item = Reference(DocumentReference/ex-documentreference)
//TODO: Reported a bug in the IG builder https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/List.2Eitem.20that.20is.20a.20list
//* entry[1].item = Reference(List/ex-list)
* extension[contentTypeCode].valueCodeableConcept = http://snomed.info/sct#225728007
* extension[sourceId].valueIdentifier.value = "urn:oid:1.2.3.4"

Instance:   ex-compEmailPackage
InstanceOf: IHE.MHD.Comprehensive.SubmissionSet
Title: "Example Comprehensive Email SubmissionSet"
Description:      "SubmissionSet in List resource conforming Comprehensive metadata with an intendedRecipient"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-patient)
* identifier[0].system = "urn:ietf:rfc:3986"
* identifier[0].value = "urn:oid:1.2.129.6.58.92.88337.4"
* identifier[0].use = #official
* identifier[1].system = "http://example.org/documents"
* identifier[1].value = "23425234-23470"
* identifier[1].use = #usual
* status = #current
* mode = #working
* title = "Example SubmissionSet for comprehensive metadata with an intendedRecipient"
* code = MHDlistTypes#submissionset
* date = 2004-12-25T23:50:50-05:00
* entry[0].item = Reference(DocumentReference/ex-documentreference)
* extension[contentTypeCode].valueCodeableConcept = http://snomed.info/sct#225728007
* extension[sourceId].valueIdentifier.value = "urn:oid:1.2.3.4"
* extension[intendedRecipient].valueReference = Reference(Practitioner/ex-practitioner)
