Profile:        FindListsResponse
Parent:         Bundle
Id:             IHE.MHD.FindDocumentListsResponseMessage
Title:          "MHD Find Document Lists Response Message"
Description:    "A profile on the Find Document Lists Response message for ITI-66"
* type = #searchset (exactly)
* total 1..
* entry ^slicing.discriminator[0].type = #profile
* entry ^slicing.discriminator[0].path = "resource"
* entry ^slicing.rules = #closed
* entry contains 
  SubmissionSet 0..* and
  Folder 0..*
* entry[SubmissionSet] ^short = "SubmissionSets"
* entry[SubmissionSet].fullUrl 1..
* entry[SubmissionSet].resource 1..
* entry[SubmissionSet].resource ^type.code = "List"
* entry[SubmissionSet].resource ^type.profile = Canonical(IHE.MHD.Minimal.SubmissionSet)
* entry[Folder] ^short = "Folders"
* entry[Folder].fullUrl 1..
* entry[Folder].resource 1..
* entry[Folder].resource ^type.code = "List"
* entry[Folder].resource ^type.profile = Canonical(IHE.MHD.Minimal.Folder)


