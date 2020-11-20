// equivilant to MHD Minimal List Folder
Profile:        Folder
Parent:         List
Id:             IHE.MHD.Minimal.ListFolder
Title:          "MHD Folder in List"
Description:    "A profile on the List resource for MHD Minimal Metadata Folder."
* extension contains TypeOfList named typeOfList 0..*
* identifier 0..*
//* status
* mode = #working
* title 1..1
* code 1..1 
* code = MHDlistTypes#folder
* subject 0..1
* subject only Reference(Patient)
* encounter 0..0
* date 1..1
* source ^type.aggregation = #contained
* orderedBy 0..0
* note 0..1
* entry.flag 0..0
* entry.deleted 0..0
* entry.date 0..0
* entry.item 1..1
* entry.item only Reference(DocumentReference)
* entry.item ^type.aggregation = #referenced
* emptyReason 0..0

// TODO: Finish mappings to XDS 
Mapping: Folder-Mapping
Source:	Folder
Target: "XDS"
Title: "XDS and MHD Mapping"
* identifier -> "Folder.entryUUID"
* status -> "Folder.status"
* mode -> "fixed at working"
* title -> "Folder.title"
* code -> "toggle submissionSet vs folder"
* subject -> "Folder.patient"
