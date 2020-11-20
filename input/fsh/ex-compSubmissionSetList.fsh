Instance:   ex-compSubmissionSetList
InstanceOf: IHE.MHD.Comprehensive.ListManifest
Title: "Example Comprehensive List Manifest"
Description:      "SubmissionSet in List resource conforming only to Comprehensive metadata"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/example)
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
* source = Reference(Organization/example)
* entry[0].item = Reference(DocumentReference/example)
* entry[1].item = Reference(List/example)
* extension[TypeOfList][0].valueCodeableConcept = http://snomed.info/sct#225728007
* extension[TypeOfList][1].valueCodeableConcept = http://snomed.info/sct#284548004
