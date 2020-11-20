Instance:   ex-minimalFolderList
InstanceOf: IHE.MHD.Minimal.ListFolder
Title: "Example Minimal List Folder"
Description:      "Folder in List resource conforming only to Minimal metadata"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier[0].system = "urn:ietf:rfc:3986"
* identifier[0].value = "urn:oid:1.2.129.6.58.92.88337.4"
* identifier[0].use = #official
* identifier[1].system = "http://example.org/documents"
* identifier[1].value = "23425234-23470"
* identifier[1].use = #usual
* status = #current
* mode = #working
* title = "Example Folder with minimal metadata"
* code = MHDlistTypes#folder
* date = 2004-12-25T23:50:50-05:00
* source = Reference(example-organization)
* entry[0].item = Reference(example-documentreference)
* entry[1].item = Reference(example-documentreference2)
* extension[TypeOfList].valueCodeableConcept = http://snomed.info/sct#225728007
