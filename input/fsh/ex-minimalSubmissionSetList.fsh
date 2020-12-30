Instance:   ex-minimalSubmissionSetList
InstanceOf: IHE.MHD.Minimal.ListManifest
Title:      "SubmissionSet List for Minimal metadata"
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
* title = "Example of Submission with minimal metadata"
* code = MHDlistTypes#submissionset
* date = 2004-12-25T23:50:50-05:00
* entry[0].item = Reference(DocumentReference/ex-documentreference)
* entry[1].item = Reference(List/ex-minimalFolderList)
* extension[TypeOfList].valueCodeableConcept = http://snomed.info/sct#225728007
* extension[sourceOrg].valueReference = Reference(Organization/ex-organization)
