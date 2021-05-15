Profile:        FindListsResponse
Parent:         Bundle
Id:             IHE.MHD.FindDocumentListsResponseMessage
Title:          "MHD Find Document Lists Response Message"
Description:    "A profile on the Find Document Lists Response message for ITI-66"
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