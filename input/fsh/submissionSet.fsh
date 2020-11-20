// equivilant to MHD Minimal List Manifest
Profile:        SubmissionSet
Parent:         List
Id:             IHE.MHD.Minimal.ListManifest
Title:          "MHD SubmissionSet in List"
Description:    "A profile on the List resource for MHD SubmissionSet."
* extension contains TypeOfList named typeOfList 0..*
* identifier 0..*
//* status
* mode = #working
* title 1..1
* code 1..1 
* code = MHDlistTypes#submissionset
* subject 0..1
* subject only Reference(Patient)
* encounter 0..0
* date 1..1
* orderedBy 0..0
* source ^type.aggregation = #contained
* note 0..0
* entry.flag 0..0
* entry.deleted 0..0
* entry.date 0..0
* entry.item 1..1
* entry.item only Reference(DocumentReference or List)
* entry.item ^type.aggregation = #referenced
* emptyReason 0..0

// TODO: Finish mappings to XDS 
Mapping: SubmissionSet-Mapping
Source:	SubmissionSet
Target: "XDS"
Title: "XDS and MHD Mapping"
* identifier -> "SubmissionSet.entryUUID"

