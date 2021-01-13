// equivalent to MHD Provide Document Bundle transaction
Profile:        MinimalProvideDocumentBundle
Parent:         Bundle
Id:             IHE.MHD.Minimal.ProvideBundle
Title:          "MHD Minimal Provide Document Bundle"
Description:    "A profile on the Bundle transaction for Provide Document resources with Minimal metadata for MHD.
* all resources may be marked minimal, comprehensive, or unContained
* shall be a Bundle
* shall be a Transaction
* shall have a SubmissionSet
* may have one or more DocumentReference
* may have one or more Binary
* may have one or more Folder
* may have one Patient
"
// not clear that meta.profile needs to be profiled when the requirement is that this profile is mentioned.
* meta.profile 1..*
// TODO confirm this profile URI
//* meta.profile = http://ihe.net/fhir/StructureDefinition/IHE.MHD.Minimal.ProvideBundle
* type = #transaction
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry ^slicing.description = "Slicing based on the profile conformance of the entry"
* entry and entry.resource MS
* entry contains 
    SubmissionSet 1..1 and
    DocumentRefs 0..* and
    Documents 0..* and
    Folders 0..* and
    Patient 0..1
* entry[SubmissionSet].resource only
    IHE.MHD.Minimal.SubmissionSet or
    IHE.MHD.UnContained.Comprehensive.SubmissionSet or
    IHE.MHD.Comprehensive.SubmissionSet
* entry[SubmissionSet] ^short = "the SubmissionSet"
* entry[SubmissionSet] ^definition = "The SubmissionSet defines who submitted it, why they submitted it, when they submitted, what is in it, and where it is destine."
* entry[SubmissionSet].request 1..1
* entry[SubmissionSet].request.method = #POST
* entry[DocumentRefs].resource only 
    IHE.MHD.Minimal.DocumentReference or
    IHE.MHD.UnContained.Comprehensive.DocumentReference or
    IHE.MHD.Comprehensive.DocumentReference
* entry[DocumentRefs] ^short = "the DocumentReference resources"
* entry[DocumentRefs] ^definition = "any and all DocumentReference that are part of the SubmissionSet. These might be new, replacements, or other associations"
* entry[DocumentRefs].request 1..1
* entry[DocumentRefs].request.method = #POST
* entry[Documents].resource only Binary
* entry[Documents] ^short = "the documents"
* entry[Documents] ^definition = "the documents referenced by the DocumentReference resources"
* entry[Documents].request 1..1
* entry[Documents].request.method = #POST
* entry[Folders].resource only 
    IHE.MHD.Minimal.Folder or
    IHE.MHD.Minimal.Folder
* entry[Folders] ^short = "Folders"
* entry[Folders] ^definition = "any Folders being created or updated"
* entry[Folders].request 1..1
* entry[Folders].request.method = #POST
* entry[Patient].resource only Patient
* entry[Patient] ^short = "the Patient"
* entry[Patient] ^definition = "the Patient"


Profile:        UnContainedComprehensiveProvideDocumentBundle
Parent:         IHE.MHD.Minimal.ProvideBundle
Id:             IHE.MHD.UnContained.Comprehensive.ProvideBundle
Title:          "MHD UnContained Comprehensive Provide Document Bundle"
Description:    "A profile on the Bundle transaction for Provide Document resources with UnContained allowed but requiring Comprehensive Metadata for MHD.
* all resources must be Comprehensive other than the Containment requirement
* shall be a Bundle
* shall be a Transaction
* shall have a SubmissionSet
* may have one or more DocumentReference
* may have one or more Binary
* may have one or more Folder
* may have one Patient
"
// not clear that meta.profile needs to be profiled when the requirement is that this profile is mentioned.
// TODO confirm this profile URI
//* meta.profile = http://ihe.net/fhir/StructureDefinition/IHE.MHD.Minimal.ProvideBundle
* entry[SubmissionSet].resource only
    IHE.MHD.UnContained.Comprehensive.SubmissionSet or
    IHE.MHD.Comprehensive.SubmissionSet
* entry[DocumentRefs].resource only 
    IHE.MHD.UnContained.Comprehensive.DocumentReference or
    IHE.MHD.Comprehensive.DocumentReference
* entry[Folders].resource only 
    IHE.MHD.Minimal.Folder



Profile:        ComprehensiveProvideDocumentBundle
Parent:         IHE.MHD.UnContained.Comprehensive.ProvideBundle
Id:             IHE.MHD.Comprehensive.ProvideBundle
Title:          "MHD Comprehensive Provide Document Bundle"
Description:    "A profile on the Bundle transaction for Provide Document resources with Comprehensive Metadata for MHD.
* this is otherwise known as XDS-on-FHIR
* all resources must be Comprehensive 
* shall be a Bundle
* shall be a Transaction
* shall have a SubmissionSet
* may have one or more DocumentReference
* may have one or more Binary
* may have one or more Folder
* may have one Patient
"
// not clear that meta.profile needs to be profiled when the requirement is that this profile is mentioned.
// TODO confirm this profile URI
//* meta.profile = http://ihe.net/fhir/StructureDefinition/IHE.MHD.Minimal.ProvideBundle
* entry[SubmissionSet].resource only
    IHE.MHD.Comprehensive.SubmissionSet
* entry[DocumentRefs].resource only 
    IHE.MHD.Comprehensive.DocumentReference
* entry[Folders].resource only 
    IHE.MHD.Minimal.Folder
