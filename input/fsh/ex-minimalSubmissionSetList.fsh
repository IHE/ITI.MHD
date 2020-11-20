Instance:   ex-minimalSubmissionSetList
InstanceOf: IHE.MHD.Minimal.ListManifest
Title:      "SubmissionSet List for Minimal metadata"
Description: "Example of a minimal submissionSet in List resource. "
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
* source = Reference(example-organization)
* entry[0].item = Reference(example-documentreference)
* entry[1].item = Reference(minimalfolderList)
* extension[TypeOfList].valueCodeableConcept = http://snomed.info/sct#225728007
