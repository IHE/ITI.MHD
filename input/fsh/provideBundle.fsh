// equivalent to MHD Provide Document Bundle transaction
Profile:        MinimalProvideDocumentBundle
Parent:         Bundle
Id:             IHE.MHD.Minimal.ProvideBundle
Title:          "MHD Minimal Provide Document Bundle"
Description:    "A profile on the Bundle transaction for ITI-65 Provide Document resources with Minimal metadata for MHD.

- [Minimal Metadata](StructureDefinition-IHE.MHD.Minimal.ProvideBundle.html): `http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.ProvideBundle`
  - shall be a Transaction Bundle
  - all resources shall be compliant with minimal constraints, they may be marked minimal, comprehensive, or unContained
  - shall create a [SubmissionSet type List](StructureDefinition-IHE.MHD.Minimal.SubmissionSet.html) that is either minimal, comprehensive, or unContained
  - may create one or more [DocumentReference](StructureDefinition-IHE.MHD.Minimal.DocumentReference.html) that is either minimal, comprehensive, or unContained
  - may create one or more [Binary](http://hl7.org/fhir/R4/binary.html)
  - may create/update one or more [Folder type List](StructureDefinition-IHE.MHD.Minimal.Folder.html) that is either minimal, comprehensive, or unContained
  - may create/update/read one [Patient](http://hl7.org/fhir/R4/patient.html)"
* meta.profile 1..*
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
    IHE.MHD.Minimal.SubmissionSet 
* entry[SubmissionSet] ^short = "the SubmissionSet"
* entry[SubmissionSet] ^definition = "The SubmissionSet defines who submitted it, why they submitted it, when they submitted, what is in it, and where it is destine."
* entry[SubmissionSet].resource 1..1
* entry[SubmissionSet].request 1..1
* entry[SubmissionSet].request.method = #POST
* entry[DocumentRefs].resource only 
    IHE.MHD.Minimal.DocumentReference 
* entry[DocumentRefs] ^short = "the DocumentReference resources"
* entry[DocumentRefs] ^definition = "any and all DocumentReference that are part of the SubmissionSet. These might be new, replacements, or other associations"
* entry[DocumentRefs].resource 1..1
* entry[DocumentRefs].request 1..1
* entry[DocumentRefs].request.method = #POST
* entry[Documents].resource ^type.code = "Binary"
* entry[Documents].resource ^type.profile = Canonical(Binary)
* entry[Documents] ^short = "the documents"
* entry[Documents] ^definition = "the documents referenced by the DocumentReference resources"
* entry[Documents].resource 1..1
* entry[Documents].request 1..1
* entry[Documents].request.method = #POST
* entry[Folders].resource only 
    IHE.MHD.Minimal.Folder 
* entry[Folders] ^short = "Folders"
* entry[Folders] ^definition = "any Folders being created or updated"
* entry[Folders].resource 1..1
* entry[Folders].request 1..1
* entry[Folders].request.method from MHDprovideFolderActions
* entry[Patient].resource ^type.code = "Patient"
* entry[Patient].resource ^type.profile = Canonical(Patient)
* entry[Patient] ^short = "the Patient"
* entry[Patient] ^definition = "the Patient"
* entry[Patient].resource 1..1
* entry[Patient].request.method from MHDprovidePatientActions

ValueSet: MHDprovideFolderActions
Title: "MHD Folder List Types ValueSet"
Description: "A ValueSet of the allowed actions in a ITI-65 Provide Document Bundle for the Folder List type Resources. Where Folders are allowed to be Updated in addition to Created."
* http://hl7.org/fhir/http-verb#POST
* http://hl7.org/fhir/http-verb#PUT

ValueSet: MHDprovidePatientActions
Title: "MHD Patient Types ValueSet"
Description: "A ValueSet of the allowed actions in a ITI-65 Provide Document Bundle for the Patient type Resource. Where Patient would typically be indicated as a GET (read), but might be created or updated depending on policy."
* http://hl7.org/fhir/http-verb#GET
* http://hl7.org/fhir/http-verb#POST
* http://hl7.org/fhir/http-verb#PUT



Profile:        UnContainedComprehensiveProvideDocumentBundle
Parent:         IHE.MHD.Minimal.ProvideBundle
Id:             IHE.MHD.UnContained.Comprehensive.ProvideBundle
Title:          "MHD UnContained Comprehensive Provide Document Bundle"
Description:    "A profile on the Bundle transaction for ITI-65 Provide Document resources with UnContained allowed but requiring Comprehensive Metadata for MHD.

- [UnContained Comprehensive Metadata](StructureDefinition-IHE.MHD.UnContained.Comprehensive.ProvideBundle.html): `http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.UnContained.Comprehensive.ProvideBundle` 
  - note that Minimal Metadata does not require containment, so UnContained Minimal is the same as Minimal Metadata
  - note that UnContained only applies to DocumentReference and SubmissionSet type Lists; so the following apply
  - shall be a Transaction Bundle
  - all resources shall be compliant with comprehensive unContained constraints, they may be marked comprehensive unContained
  - shall create a [SubmissionSet type List](StructureDefinition-IHE.MHD.Minimal.SubmissionSet.html) that is either minimal, comprehensive, or unContained
  - may create one or more [DocumentReference](StructureDefinition-IHE.MHD.Minimal.DocumentReference.html) that is either minimal, comprehensive, or unContained
  - may create one or more [Binary](http://hl7.org/fhir/R4/binary.html)
  - may create/update one or more [Folder type List](StructureDefinition-IHE.MHD.Minimal.Folder.html) that is either minimal, comprehensive, or unContained
  - may create/update/read one [Patient](http://hl7.org/fhir/R4/patient.html)"
* entry[SubmissionSet].resource only
    IHE.MHD.UnContained.Comprehensive.SubmissionSet
* entry[DocumentRefs].resource only 
    IHE.MHD.UnContained.Comprehensive.DocumentReference




Profile:        ComprehensiveProvideDocumentBundle
Parent:         IHE.MHD.UnContained.Comprehensive.ProvideBundle
Id:             IHE.MHD.Comprehensive.ProvideBundle
Title:          "MHD Comprehensive Provide Document Bundle"
Description:    "A profile on the Bundle transaction for ITI-65 Provide Document resources with Comprehensive Metadata for MHD.

- [Comprehensive Metadata](StructureDefinition-IHE.MHD.Comprehensive.ProvideBundle.html): `http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.ProvideBundle`
  - this is otherwise known as XDS-on-FHIR
  - shall be a Transaction Bundle
  - all resources shall be compliant with comprehensive constraints, they may be marked comprehensive
  - shall create a [SubmissionSet type List](StructureDefinition-IHE.MHD.Minimal.SubmissionSet.html) that is either minimal, comprehensive, or unContained
  - may create one or more [DocumentReference](StructureDefinition-IHE.MHD.Minimal.DocumentReference.html) that is either minimal, comprehensive, or unContained
  - may create one or more [Binary](http://hl7.org/fhir/R4/binary.html)
  - may create/update one or more [Folder type List](StructureDefinition-IHE.MHD.Minimal.Folder.html) that is either minimal, comprehensive, or unContained
  - may create/update/read one [Patient](http://hl7.org/fhir/R4/patient.html)"
* entry[SubmissionSet].resource only
    IHE.MHD.Comprehensive.SubmissionSet
* entry[DocumentRefs].resource only 
    IHE.MHD.Comprehensive.DocumentReference


Profile:        ProvideDocumentBundleResponse
Parent:         Bundle
Id:             IHE.MHD.ProvideDocumentBundleResponse
Title:          "MHD Provide Document Bundle Response"
Description:    """
A profile on the Bundle transaction-response for ITI-65 Provide Document Bundle response.

- shall be a transaction response
- shall have at least 1 entry for each entry in the request, in the same order as received in the request
  - entry response location must be indicated
"""
* type = #transaction-response
* entry 1..* 
* entry ^short = "One entry for each entry in the request, in the same order as received"
* entry.response 1..
* entry.response ^short = "Indicating the results of processing the entry"
* entry.response.location 1..
