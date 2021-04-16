Profile:        FindDocumentReferencesComprehensiveResponse
Parent:         Bundle
Id:             IHE.MHD.FindDocumentReferencesComprehensiveResponseMessage
Title:          "MHD Find Document References Comprehensive Response message"
Description:    "A profile on the Find Document References Comprehensive Response message for ITI-67"
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
* type = #searchset (exactly)
* total 1..
* entry ^slicing.discriminator[0].type = #profile
* entry ^slicing.discriminator[0].path = "resource"
* entry ^slicing.rules = #open
* entry.fullUrl 1..
* entry contains DocumentReference 0..*
* entry[DocumentReference] ^short = "DocumentReference"
* entry[DocumentReference].resource 1..
* entry[DocumentReference].resource only ComprehensiveDocumentReference