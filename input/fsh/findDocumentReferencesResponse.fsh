Profile:        FindDocumentReferencesResponse
Parent:         Bundle
Id:             IHE.MHD.FindDocumentReferencesResponseMessage
Title:          "MHD Find Document References Response message"
Description:    "A profile on the Find Document References Response message for ITI-67"
* type = #searchset (exactly)
* total 1..
* entry ^slicing.discriminator[0].type = #profile
* entry ^slicing.discriminator[0].path = "resource"
* entry ^slicing.rules = #open
* entry.fullUrl 1..
* entry contains DocumentReference 0..*
* entry[DocumentReference] ^short = "DocumentReference"
* entry[DocumentReference].resource 1..
* entry[DocumentReference].resource only MinimalDocumentReference