// equivalent to MHD Minimal Folder
Profile:        Folder
Parent:         List
Id:             IHE.MHD.Minimal.Folder
Title:          "MHD Folder Minimal"
Description:    "A profile on the List resource for MHD Minimal Metadata Folder."
* extension contains CodeList named codeList 0..* MS
* identifier 2..*
//* status 
* mode = #working
* title 0..1
* code 1..1 
* code = MHDlistTypes#folder
* subject 0..1 MS
* subject only Reference(Patient)
* encounter 0..0
* date 0..1
* orderedBy 0..0
* source 0..0
* note 0..1
* entry.flag 0..0
* entry.deleted 0..0
* entry.date 0..0
* entry.item 1..1
* entry.item only Reference(DocumentReference)
* emptyReason 0..0

Extension: CodeList
Id: ihe-folder-codelist
Title: "Clinical type of the Folder"
Description: "Expresses type of Folder. Usually expressed in LOINC or SNOMED."
* value[x] only CodeableConcept

// Note there is no impact of UnContained on a folder
// equivalent to MHD Comprehensive List Folder 
Profile:        FolderComprehensive
Parent:         IHE.MHD.Minimal.Folder
Id:             IHE.MHD.Comprehensive.Folder
Title:          "MHD Folder Comprehensive"
Description:    "A profile on the List resource for MHD Comprehensive Metadata Folder. Note UnContained has no impact on Folder."
* subject 1..1
* extension[codeList] 1..*
* title 1..1

//  mappings to XDS 
Mapping: Folder-Mapping
Source:	IHE.MHD.Minimal.Folder
Target: "XDS"
Title: "XDS and MHD Mapping"
* -> "XDS Folder" "Used in the context of the IHE MHD ImplementationGuide"
* meta.profile -> "Folder.limitedMetadata"
* extension[codeList] -> "Folder.codeList"
* identifier -> "Folder.entryUUID and Folder.uniqueId"
* status -> "Folder.availabilityStatus"
* mode -> "shall be 'working'"
* title -> "Folder.title"
* code -> "shall be 'folder'"
* subject -> "Folder.patientId"
* encounter -> "n/a"
* date -> "Folder.lastUpdateTime"
* source -> "n/a"
* orderedBy -> "n/a"
* note -> "Folder.comments"
* entry.flag -> "n/a"
* entry.deleted -> "n/a"
* entry.date -> "n/a"
* entry.item -> "references to DocumentReference(s)"
* emptyReason -> "n/a"
