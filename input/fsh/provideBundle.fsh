// TODO confirm this profile URI, noticed the word doc is still using _, while here I use .

// due to a strange sushi problem, where it does not recognize core FHIR Resources can be refereed to by profile (structureDefinition). I add this dummy profile in front of minimal to slice purely on resource types, that way the formal named profiles can just profile based on profiles.

Profile:        DummyProvideDocumentBundle
Parent:         Bundle
Id:             IHE.MHD.Dummy.ProvideBundle
Title:          "MHD Dummy Provide Document Bundle"
Description:    "A profile on the Bundle transaction for Provide Document resources with Dummy metadata for MHD.
* all resources are just core FHIR resources
* shall be a Bundle
* shall be a Transaction
* shall have one or more List resources
* may have one or more DocumentReference
* may have one or more Binary
* may have one or more Patient
* can not have anything else (closed)
"
* type = #transaction
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry ^slicing.description = "Slicing based on the resource type of the entry"
* entry contains 
    Lists 1..* and
    DocRefs 0..* and
    Bin 0..* and
    Pat 0..1
* entry[Lists].resource only List
* entry[Lists] ^short = "SubmissionSet and Folders"
* entry[Lists] ^definition = "The SubmissionSet and Folders defines who submitted it, why they submitted it, when they submitted, what is in it, and where it is destine."
* entry[Lists].request.method = #POST
* entry[Lists].request.url 1..1
* entry[Lists].fullUrl 1..1
* entry[DocRefs].resource only DocumentReference
* entry[DocRefs] ^short = "DocumentReference resources"
* entry[DocRefs] ^definition = "The DocumentReference resources to be published or pushed."
* entry[DocRefs].request.method = #POST
* entry[DocRefs].request.url 1..1
* entry[DocRefs].fullUrl 1..1
* entry[Bin].resource only Binary
* entry[Bin] ^short = "Binary resources"
* entry[Bin] ^definition = "The document bits in a Binary resources to be published or pushed."
* entry[Bin].request.method = #POST
* entry[Bin].request.url 1..1
* entry[Bin].fullUrl 1..1
* entry[Pat].resource only Patient
* entry[Pat] ^short = "Patient"
* entry[Pat] ^definition = "The Patient is unusual, and only allowed in PUSH scenarios."
* entry[Pat].request.method = #POST
* entry[Pat].request.url 1..1
* entry[Pat].fullUrl 1..1


// equivalent to MHD Provide Document Bundle transaction
Profile:        MinimalProvideDocumentBundle
Parent:         DummyProvideDocumentBundle
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
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry ^slicing.description = "Slicing based on the profile conformance of the entry"
* entry contains 
    SubmissionSet 1..1 and
    DocumentRefs 0..* and
    Folders 0..* 
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
* entry[Folders].resource only 
    IHE.MHD.Minimal.Folder or
    IHE.MHD.Comprehensive.Folder
* entry[Folders] ^short = "Folders"
* entry[Folders] ^definition = "any Folders being created or updated"
* entry[Folders].request 1..1
* entry[Folders].request.method = #POST


Profile:        UnContainedComprehensiveProvideDocumentBundle
Parent:         DummyProvideDocumentBundle
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
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry ^slicing.description = "Slicing based on the profile conformance of the entry"
* entry contains 
    SubmissionSet 1..1 and
    DocumentRefs 0..* and
    Folders 0..* 
* entry[SubmissionSet].resource only
    IHE.MHD.UnContained.Comprehensive.SubmissionSet or
    IHE.MHD.Comprehensive.SubmissionSet
* entry[SubmissionSet] ^short = "the SubmissionSet"
* entry[SubmissionSet] ^definition = "The SubmissionSet defines who submitted it, why they submitted it, when they submitted, what is in it, and where it is destine."
* entry[SubmissionSet].request 1..1
* entry[SubmissionSet].request.method = #POST
* entry[DocumentRefs].resource only 
    IHE.MHD.UnContained.Comprehensive.DocumentReference or
    IHE.MHD.Comprehensive.DocumentReference
* entry[DocumentRefs] ^short = "the DocumentReference resources"
* entry[DocumentRefs] ^definition = "any and all DocumentReference that are part of the SubmissionSet. These might be new, replacements, or other associations"
* entry[DocumentRefs].request 1..1
* entry[DocumentRefs].request.method = #POST
* entry[Folders].resource only 
    IHE.MHD.Comprehensive.Folder
* entry[Folders] ^short = "Folders"
* entry[Folders] ^definition = "any Folders being created or updated"
* entry[Folders].request 1..1
* entry[Folders].request.method = #POST



Profile:        ComprehensiveProvideDocumentBundle
Parent:         DummyProvideDocumentBundle
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
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry ^slicing.description = "Slicing based on the profile conformance of the entry"
* entry contains 
    SubmissionSet 1..1 and
    DocumentRefs 0..* and
    Folders 0..* 
* entry[SubmissionSet].resource only
    IHE.MHD.Comprehensive.SubmissionSet
* entry[SubmissionSet] ^short = "the SubmissionSet"
* entry[SubmissionSet] ^definition = "The SubmissionSet defines who submitted it, why they submitted it, when they submitted, what is in it, and where it is destine."
* entry[SubmissionSet].request 1..1
* entry[SubmissionSet].request.method = #POST
* entry[DocumentRefs].resource only 
    IHE.MHD.Comprehensive.DocumentReference
* entry[DocumentRefs] ^short = "the DocumentReference resources"
* entry[DocumentRefs] ^definition = "any and all DocumentReference that are part of the SubmissionSet. These might be new, replacements, or other associations"
* entry[DocumentRefs].request 1..1
* entry[DocumentRefs].request.method = #POST
* entry[Folders].resource only 
    IHE.MHD.Comprehensive.Folder
* entry[Folders] ^short = "Folders"
* entry[Folders] ^definition = "any Folders being created or updated"
* entry[Folders].request 1..1
* entry[Folders].request.method = #POST
