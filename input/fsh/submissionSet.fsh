// equivalent to MHD Minimal List Manifest
Profile:        SubmissionSet
Parent:         List
Id:             IHE.MHD.Minimal.ListManifest
Title:          "MHD SubmissionSet in List"
Description:    "A profile on the List resource for MHD SubmissionSet."
* extension contains TypeOfList named typeOfList 0..1
* extension contains SourceOrg named sourceOrg 0..1
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
* source 0..0
* orderedBy 0..0
* note 0..0
* entry.flag 0..0
* entry.deleted 0..0
* entry.date 0..0
* entry.item 1..1
* entry.item only Reference(DocumentReference or List)
* emptyReason 0..0

Extension: SourceOrg
Id: ihe-sourceOrg
Title: "Publisher organization of the SubmissionSet"
Description: "holds the identity of the organization that submitted the SubmissionSet"
* value[x] only Reference(Organization)


// equivalent to MHD UnContained Comprehensive List Manifest
Profile:        SubmissionSetUnContainedComprehensive
Parent:         IHE.MHD.Minimal.ListManifest
Id:             IHE.MHD.UnContained.Comprehensive.ListManifest
Title:          "MHD UnContained Comprehensive SubmissionSet in List"
Description:    "A profile on the List resource for MHD UnContained Comprehensive SubmissionSet."
* subject 1..1
//TODO: figure out how to increase cardinality to mandate this extension
* extension[TypeOfList] 1..1


// equivalent to MHD Comprehensive List Manifest Contained
Profile:        SubmissionSetComprehensive
Parent:         IHE.MHD.UnContained.Comprehensive.ListManifest
Id:             IHE.MHD.Comprehensive.ListManifest
Title:          "MHD Comprehensive SubmissionSet in List"
Description:    "A profile on the List resource for MHD Comprehensive SubmissionSet."
* source ^type.aggregation = #contained
* entry.item ^type.aggregation = #referenced

// TODO: Finish mappings to XDS 
Mapping: SubmissionSet-Mapping
Source:	SubmissionSet
Target: "XDS"
Title: "XDS and MHD Mapping"
* identifier -> "SubmissionSet.entryUUID"

