Profile:        FindListsResponse
Parent:         Bundle
Id:             IHE.MHD.FindDocumentListsResponseMessage
Title:          "MHD Find Document Lists Response Message"
Description:    "A profile on the Find Document Lists Response message for ITI-66"
* ^version = "3.1.1"
* ^date = "2020-04-16"
* ^publisher = "Integrating the Healthcare Enterprise (IHE)" 
* ^contact[0].name = "IHE"
* ^contact[0].telecom.system = #url
* ^contact[0].telecom.value = "http://ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom.system = #email
* ^contact[1].telecom.value = "JohnMoehrke@gmail.com"
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property" 
* type = #searchset (exactly)
* total 1..
* entry ^slicing.discriminator[0].type = #profile
* entry ^slicing.discriminator[0].path = "resource"
* entry ^slicing.rules = #open
* entry.fullUrl 1..
* entry contains List 0..*
* entry[List] ^short = "List"
* entry[List].resource 1..
* entry[List].resource ^type.code = "List"
* entry[List].resource ^type.profile = Canonical(MhdList)