// equivalent to MHD Minimal DocuentReference
Profile:        MinimalDocumentReference
Parent:         DocumentReference
Id:             IHE.MHD.Minimal.DocumentReference
Title:          "MHD Minimal DocumentReference"
Description:    "A profile on the DocumentReference resource for MHD."
* masterIdentifier 1..1
* docStatus 0..0
* type MS
* category 0..1 MS
* subject 0..1
* subject only Reference(Patient)
* date MS
* custodian 0..0
* relatesTo MS
* securityLabel MS
* content 1..1
* content.attachment MS
* content.attachment.contentType 1..1
* content.attachment.contentType MS
* content.attachment.language MS
* content.attachment.data 0..0
* content.attachment.url 1..1
* content.format MS
* context MS
* context.period MS
* context.facilityType MS
* context.practiceSetting MS

// equivalent to MHD Comprehensive DocumentReference - uncontained
Profile:        ComprehensiveUnContainedDocumentReference
Parent:         MinimalDocumentReference
Id:             IHE.MHD.ComprehensiveUnContained.DocumentReference
Title:          "MHD Comprehensive DocumentReference"
Description:    "A profile on the DocumentReference resource for MHD Comprehensive."
* type 1..1
* category 1..1
* subject 1..1
* date 1..1
* securityLabel 1..*
* content.attachment.language 1..1
* content.attachment.creation 1..1
* content.format 1..1
* context.facilityType 1..1
* context.practiceSetting 1..1

// equivalent to MHD Comprehensive DocumentReference - contained
Profile:        ComprehensiveContainedDocumentReference
Parent:         ComprehensiveUnContainedDocumentReference
Id:             IHE.MHD.ComprehensiveContained.DocumentReference
Title:          "MHD Comprehensive Contained DocumentReference"
Description:    "A profile on the DocumentReference resource for MHD Comprehensive Contained (not UnContained)."
* author ^type.aggregation = #contained
* authenticator ^type.aggregation = #contained
* context.sourcePatientInfo ^type.aggregation = #contained

// TODO: Finish mappings to XDS 
Mapping: DocumentEntry-Mapping
Source:	ComprehensiveContainedDocumentReference
Target: "XDS"
Title: "XDS and MHD Mapping"