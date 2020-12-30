// equivalent to MHD Minimal List Folder
Profile:        Folder
Parent:         List
Id:             IHE.MHD.Minimal.ListFolder
Title:          "MHD Folder in List"
Description:    "A profile on the List resource for MHD Minimal Metadata Folder."
* extension contains TypeOfList named typeOfList 0..1
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
* orderedBy 0..0
* note 0..1
* entry.flag 0..0
* entry.deleted 0..0
* entry.date 0..0
* entry.item 1..1
* entry.item only Reference(DocumentReference)
* emptyReason 0..0


// equivalent to MHD UnContained Comprehensive List Folder
Profile:        FolderUnContainedComprehensive
Parent:         IHE.MHD.Minimal.ListFolder
Id:             IHE.MHD.UnContained.Comprehensive.ListFolder
Title:          "MHD UnContained Comprehensive Folder in List"
Description:    "A profile on the List resource for MHD UnContained Comprehensive Metadata Folder."
* subject 1..1
* extension[TypeOfList] 1..1

// equivalent to MHD Comprehensive Contained List Folder
Profile:        FolderComprehensive
Parent:         IHE.MHD.UnContained.Comprehensive.ListFolder
Id:             IHE.MHD.Comprehensive.ListFolder
Title:          "MHD Comprehensive Folder in List"
Description:    "A profile on the List resource for MHD Comprehensive Metadata Folder."
* source ^type.aggregation = #contained
* entry.item ^type.aggregation = #referenced


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