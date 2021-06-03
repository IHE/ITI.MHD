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

Profile:        FindDocumentReferencesComprehensiveResponse
Parent:         Bundle
Id:             IHE.MHD.FindDocumentReferencesComprehensiveResponseMessage
Title:          "MHD Find Document References Comprehensive Response message"
Description:    "A profile on the Find Document References Comprehensive Response message for ITI-67"
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

Instance: DocumentReference-Creation
InstanceOf: SearchParameter
Title: "search on the DocumentReference.content.attachment.creation element"
Description: "Search Parameter extension enabling clients to search on the DocumentReference.content.attachment.creation element"
Usage: #definition
* url = "http://profiles.ihe.net/ITI/MHD/SearchParameter/DocumentReference-Creation"
* description = "This SearchParameter enables finding DocumentReference by the creation dateTime."
* name = "Creation"
* status = #active
* code = #creation
* base = #DocumentReference
* expression = "DocumentReference.content.attachment.creation"
* type = #date
