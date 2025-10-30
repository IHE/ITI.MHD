Profile:        PatchParameters
Parent:         Parameters
Id:             IHE.MHD.Patch.Parameters
Title:          "MHD DocumentReference Patch Parameters"
Description:    "A profile on the Parameters resource to update the superseded DocumentReference status." 
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #open
* parameter contains operation 1..1
* parameter[operation].name = "operation"
* parameter[operation].part ^slicing.discriminator.type = #value
* parameter[operation].part ^slicing.discriminator.path = "name"
* parameter[operation].part ^slicing.rules = #open
* parameter[operation].part contains path 1..1 and type 1..1 and value 1..1
* parameter[operation].part[type].name = "type"
* parameter[operation].part[type].valueCode = #replace
* parameter[operation].part[path].name = "path"
* parameter[operation].part[path].valueString = "DocumentReference.status"
* parameter[operation].part[value].name = "value"
* parameter[operation].part[value].valueCode = #superseded

// equivalent to MHD Minimal DocumentReference
Profile:        MinimalDocumentReference
Parent:         DocumentReference
Id:             IHE.MHD.Minimal.DocumentReference
Title:          "MHD DocumentReference Minimal"
Description:    "A profile on the DocumentReference resource for MHD with minimal metadata constraints. 
- MHD is based on the [IHE Document Sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) model, 
- the [3:4.1 Abstract Metadata Model](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.1.html#4.1), and 
- the use defined here is FHIR DocumentReference implementation of the 
- ebRIM implementation at [3:4.2.3.2 Document Entry](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2).
- with use-cases and constraints found in [3:4.3 Additional Document Sharing Requirements](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.3.html#4.3)"
* modifierExtension 0..0
//* identifier[uniqueId] only UniqueIdIdentifier
//* identifier[uniqueId] 1..1
* identifier 0..* MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains 
    uniqueId 1..1 MS and
    entryUUID 0..* MS
* identifier[uniqueId].use = #usual
* identifier[uniqueId] only UniqueIdIdentifier
* identifier[entryUUID].use = #official
* identifier[entryUUID] only EntryUUIDIdentifier
* status 1..1
* status from DocumentReferenceStats (required)
* docStatus 0..0
* type 0..1 MS
* category 0..1 MS
* subject 0..1 MS
* subject only Reference(Patient)
* date 0..1 MS
* author 0..* MS
* attester 0..1
* attester.party 1..1
//* custodian 0..0
* description 0..1
* securityLabel 0..* MS
* content 1..1
* content ^definition = "The document and format referenced."
* content.attachment.contentType 1..1
* content.attachment.language 0..1 MS
* content.attachment.data 0..0
* content.attachment.url 1..1
* content.attachment.size 0..1
* content.attachment.hash 0..1
* content.attachment.title 0..1
* content.attachment.creation 0..1 MS
* content.profile 0..1 MS
* content.profile.valueCoding 1..1
//* content.profile.valueCoding from http://ihe.net/fhir/ihe.formatcode.fhir/ValueSet/formatcode (preferred)
//* context.encounter 0..0
* event 0..*
* event.concept 1..1
* period 0..1 MS
* facilityType 0..1 MS
* practiceSetting 0..1 MS
* context 0..*
* relatesTo 0..* MS
* extension contains http://hl7.org/fhir/StructureDefinition/documentreference-sourcepatient named sourcePatient 0..1 MS

// equivalent to MHD DocumentReference Comprehensive UnContained Option
Profile:        UnContainedComprehensiveDocumentReference
Parent:         IHE.MHD.Minimal.DocumentReference
Id:             IHE.MHD.UnContained.Comprehensive.DocumentReference
Title:          "MHD DocumentReference Comprehensive UnContained References Option"
Description:    "A profile on the DocumentReference resource for MHD with Comprehensive Metadata Option but without a requirement for contained author, authenticator, or sourcePatientInfo. 
- MHD is based on the [IHE Document Sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) model, 
- the [3:4.1 Abstract Metadata Model](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.1.html#4.1), and 
- the use defined here is FHIR DocumentReference implementation of the 
- ebRIM implementation at [3:4.2.3.2 Document Entry](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2).
- with use-cases and constraints found in [3:4.3 Additional Document Sharing Requirements](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.3.html#4.3)"
* type 1..1
* category 1..1
* subject 1..1
* securityLabel 1..*
* content.attachment.language 1..1
* content.attachment.creation 1..1
* content.profile 1..1
* content.profile.valueCoding 1..1
* facilityType 1..1
* practiceSetting 1..1
* extension[sourcePatient].valueReference 1..1 

// equivalent to MHD Comprehensive DocumentReference - contained
Profile:        ComprehensiveDocumentReference
Parent:         IHE.MHD.UnContained.Comprehensive.DocumentReference
Id:             IHE.MHD.Comprehensive.DocumentReference
Title:          "MHD DocumentReference Comprehensive"
Description:    "A profile on the DocumentReference resource for MHD Comprehensive Option with Contained (not UnContained), compatible with XDS-on-FHIR and XCA use.
- MHD is based on the [IHE Document Sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) model, 
- the [3:4.1 Abstract Metadata Model](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.1.html#4.1), and 
- the use defined here is FHIR DocumentReference implementation of the 
- ebRIM implementation at [3:4.2.3.2 Document Entry](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2).
- with use-cases and constraints found in [3:4.3 Additional Document Sharing Requirements](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.3.html#4.3)"
* author ^type.aggregation = #contained
* attester.party ^type.aggregation = #contained
* extension[sourcePatient].valueReference ^type.aggregation = #contained

// mappings to XDS 
Mapping: DocumentEntry-Mapping
Source:	IHE.MHD.Minimal.DocumentReference
Target: "urn:ihe:iti:xds:documententry"
Title: "XDS and MHD Mapping"
* -> "XDS DocumentEntry: Used in the context of the IHE MHD ImplementationGuide"
* category -> "DocumentEntry.classCode"
* author -> "DocumentEntry.author"
* status -> "DocumentEntry.availabilityStatus"
* description -> "DocumentEntry.comments"
* securityLabel -> "DocumentEntry.confidentialityCode"
* content.attachment.creation -> "DocumentEntry.creationTime"
* identifier[entryUUID] -> "DocumentEntry.entryUUID"
* identifier[uniqueId] -> "DocumentEntry.uniqueId"
* event.concept -> "DocumentEntry.eventCodeList"
* content.profile.valueCoding -> "DocumentEntry.formatCode"
* content.attachment.hash -> "DocumentEntry.hash"
* facilityType -> "DocumentEntry.healthcareFacilityTypeCode"
// DocumentEntry.homeCommunityId -- does not actually exist as metadata on DocumentEntry, and does not have a place in DocumentReference. might be encoded in the content.attachment.url
* content.attachment.language -> "DocumentEntry.languageCode"
* attester.party -> "DocumentEntry.legalAuthenticator"
* custodian -> "not mapped"
* content.attachment.contentType -> "DocumentEntry.mimeType"
* subject -> "DocumentEntry.patientId"
* practiceSetting -> "DocumentEntry.practiceSettingCode"
* content.attachment.url -> "DocumentEntry.repositoryUniqueId+DocumentEntry.uniqueId or DocumentEntry.URI"
* period.start -> "DocumentEntry.serviceStartTime"
* period.end -> "DocumentEntry.serviceStopTime"
* content.attachment.size -> "DocumentEntry.size"
* extension[sourcePatient].valueReference.identifier -> "DocumentEntry.sourcePatientId"
* extension[sourcePatient].valueReference.reference -> "DocumentEntry.sourcePatientInfo"
* content.attachment.title -> "DocumentEntry.title"
* type -> "DocumentEntry.typeCode"
* context -> "DocumentEntry.referenceIdList with CXi encoding for urn:ihe:iti:xds:2015:encounterId"
* basedOn -> "DocumentEntry.referenceIdList with CXi encoding for procedures"
* event.reference -> "DocumentEntry.referenceIdList using CXi encoding for type when possible"
* meta.profile -> "DocumentEntry.limitedMetadata"
// DocumentEntry.objectType -- is not represented
* relatesTo -> "DocumentEntry Associations"
* relatesTo.code -> "DocumentEntry Associations.type"
* relatesTo.target -> "DocumentEntry Associations.reference"


Instance:   AssociationTypeVsRelatesTo
InstanceOf: ConceptMap
Title:      "AssociationType vs RelatesTo"
Description: "map between XDS Association Types and MHD FHIR DocumentReference relatesTo code."
Usage: #definition
* url = "https://profiles.ihe.net/ITI/MHD/ConceptMap/AssociationTypeVsRelatesTo"
* name =  "AssociationTypeVsRelatesTo"
* title = "AssociationType vs RelatesTo"
* description = "map between XDS Association Types and MHD FHIR DocumentReference relatesTo code."
* experimental = false
* status = #active
* date = 2021-05-15
* publisher = "IHE"
* description = "map between XDS Association Types and MHD FHIR DocumentReference relatesTo code.

- Source Code - [XDS Association Types](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.2) are indicated as URN, they are here indicated as system and code
- Destination Code - [DocumentReference relatesTo code](http://hl7.org/fhir/valueset-document-relationship-type.html) are Required codes"
* purpose = "show the mapping between Association Types and relatesTo code"
* group.source = "urn:ihe:iti:2007:AssociationType"
* group.target = "http://hl7.org/fhir/document-relationship-type"
* group.element[+].code = #RPLC
* group.element[=].target.relationship = #equivalent
* group.element[=].target.code = #replaces
* group.element[+].code = #XFRM
* group.element[=].target.relationship = #source-is-narrower-than-target
* group.element[=].target.code = #transforms
* group.element[+].code = #APND
* group.element[=].target.relationship = #equivalent
* group.element[=].target.code = #appends
* group.element[+].code = #XFRM_RPLC
* group.element[=].target.relationship = #equivalent
* group.element[=].target.code = #replaces
* group.element[=].target.comment = "An XDS Transform Replacement is both a document that replaces and transforms. The mapping here indicates Replace as that is the most specific change."
* group.element[+].code = #signs
* group.element[=].target.relationship = #equivalent
* group.element[=].target.code = #signs
* group.element[+].code = #IsSnapshotOf
* group.element[=].target.relationship = #related-to
* group.element[=].target.code = #transforms
* group.element[=].target.comment = "An XDS IsSnapshotOf is a new instance of what is defined in the parent DocumentEntry (DocumentReference), thus it is a transform in a manner, but is not exactly a transform of the parent document."


ValueSet: DocumentReferenceStats
Title: "MHD DocumentReference status codes"
Description: "ValueSet that does not include entered-in-error as that does not map"
* ^experimental = false
* http://hl7.org/fhir/document-reference-status#current
* http://hl7.org/fhir/document-reference-status#superseded


Instance:   FhirStatusVsStatusCode
InstanceOf: ConceptMap
Title:      "FHIR status vs ebRIM Status Type Code"
Description: "map between XDS ebRIM Status Type Codes and MHD FHIR DocumentReference.status code."
Usage: #definition
* url = "https://profiles.ihe.net/ITI/MHD/ConceptMap/FhirStatusVsStatusCode"
* name =  "FhirStatusVsStatusCode"
* status = #active
* date = 2022-05-05
* publisher = "IHE"
* title = "FHIR status vs ebRIM Status Type Code"
* description = "map between XDS ebRIM Status Type Codes and MHD FHIR DocumentReference.status code. Table 2:3.67.4.1.3.1-2. Note that the codes given are used without a system in both FHIR and ebRIM."
* purpose = "show the mapping between ebRIM Status Type Codes and FHIR .status code"
* experimental = false
* group.source = "urn:ietf:rfc:3986"
* group.target = "http://hl7.org/fhir/document-reference-status"
* group.element[+].code = #urn:oasis:names:tc:ebxml-regrep:StatusType:Approved
* group.element[=].target.relationship = #equivalent
* group.element[=].target.code = #current
* group.element[+].code = #urn:oasis:names:tc:ebxml-regrep:StatusType:Deprecated
* group.element[=].target.relationship = #equivalent
* group.element[=].target.code = #superseded


