// equivilant to MHD Minimal DocuentReference
Profile:        MinimalDocumentReference
Parent:         DocumentReference
Id:             IHE.MHD.Minimal.DocumentReference
Title:          "MHD Minimal DocumentReference"
Description:    "A profile on the DocumentReference resource for MHD."
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

* masterIdentifier 1..1
* docStatus 0..0
* type MS
* category 0..1 MS
* subject 0..1
* subject only Reference(Patient)
* date MS
* author ^type.aggregation = #contained
* authenticator ^type.aggregation = #contained
* custodian 0..0
* relatesTo MS
* securityLabel MS
* content 1..1
* content.attachment MS
* content.attachment.contentType 1..1
* content.attachment.contentType MS
* content.attachment.language MS
* content.attachment.data 0..0
* content.attachment.url 1..1
* content.format MS
* context MS
* context.period MS
* context.facilityType MS
* context.practiceSetting MS
* context.sourcePatientInfo ^type.aggregation = #contained

