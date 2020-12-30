Instance:   ex-compFolderList
InstanceOf: IHE.MHD.Comprehensive.ListFolder
Title: "Example Comprehensive List Folder"
Description:      "Folder in List resource conforming only to Comphrensive metadata"
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
* title = "Example Folder with comprehensive metadata"
* code = MHDlistTypes#folder
* date = 2004-12-25T23:50:50-05:00
* entry[0].item = Reference(DocumentReference/ex-documentreference)
* entry[1].item = Reference(DocumentReference/ex-documentreference2)
* extension[typeOfList].valueCodeableConcept = http://snomed.info/sct#225728007
