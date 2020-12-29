// equivalent to MHD Comprehensive DocumentReference
Profile:        ComprehensiveDocumentReference
Parent:         MinimalDocumentReference
Id:             IHE.MHD.Comprehensive.DocumentReference
Title:          "MHD Comprehensive DocumentReference"
Description:    "A profile on the DocumentReference resource for MHD Comprehensive."
* ^version = "3.1.1"
* ^date = "2020-02-01"
* ^publisher = "Integrating the Healthcare Enterprise (IHE)" 
* ^contact[0].name = "IHE"
* ^contact[0].telecom.system = #url
* ^contact[0].telecom.value = "http://ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom.system = #email
* ^contact[1].telecom.value = "JohnMoehrke@gmail.com"
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property" 
//  fhir version comes from IG definition
// mappings are yet to be implemented in sushi

* type 1..1
* category 1..1
* subject 1..1
* date 1..1
* securityLabel 1..*
* content.attachment.language 1..1
* content.attachment.creation 1..1
* content.format 1..1
* context.facilityType 1..1
* context.practiceSetting 1..1

