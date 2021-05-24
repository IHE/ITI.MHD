// equivalent to MHD Minimal Folder
Profile:        Folder
Parent:         MhdList
Id:             IHE.MHD.Minimal.Folder
Title:          "MHD Folder Minimal"
Description:    "A profile on the List resource for MHD use as a Folder with minimal metadata constraints. 
- MHD is based on the [IHE Document Sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) model, 
- the [3:4.1 Abstract Metadata Model](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.1.html#4.1), and 
- the use defined here is FHIR List for use as a Folder implementation of the 
- ebRIM implementation at [3:4.2.3.4 Folder Attributes](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.4).
- with use-cases and constraints found in [3:4.3 Additional Document Sharing Requirements](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.3.html#4.3)"
* extension[designationType] 0..* MS
* identifier[entryUUID] 1..1
* identifier 2..2
//* status 
* mode = #working
* title 0..1
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


// Note there is no impact of UnContained on a folder
// equivalent to MHD Comprehensive List Folder 
Profile:        FolderComprehensive
Parent:         IHE.MHD.Minimal.Folder
Id:             IHE.MHD.Comprehensive.Folder
Title:          "MHD Folder Comprehensive"
Description:    "A profile on the List resource for MHD Comprehensive Metadata Folder. Note UnContained has no impact on Folder.
- MHD is based on the [IHE Document Sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) model, 
- the [3:4.1 Abstract Metadata Model](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.1.html#4.1), and 
- the use defined here is FHIR List for use as a Folder implementation of the 
- ebRIM implementation at [3:4.2.3.4 Folder Attributes](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.4).
- with use-cases and constraints found in [3:4.3 Additional Document Sharing Requirements](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.3.html#4.3)"
* subject 1..1
* extension[designationType] 1..*
* title 1..1

//  mappings to XDS 
Mapping: Folder-Mapping
Source:	IHE.MHD.Minimal.Folder
Target: "XDS"
Title: "XDS and MHD Mapping"
* -> "XDS Folder" "Used in the context of the IHE MHD ImplementationGuide"
* meta.profile -> "Folder.limitedMetadata"
* extension[designationType] -> "Folder.codeList"
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
