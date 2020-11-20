## FHIR Representation of Document Sharing Metadata

This section documents the mapping between IHE Document Sharing Metadata and the FHIR Resources. 

### Metadata Object Types mapped to FHIR

For details on FHIR resources and data types see HL7 FHIR http://hl7.org/fhir/R4/index.html.

Some Document Sharing Metadata attributes must be treated as ‘contained’ FHIR Resources. These are indicated in Table 4.5.1.1.1-1 using “Note 1” and the word ‘contained’. The details of the FHIR ‘contained’ mechanism is found at http://hl7.org/fhir/R4/references.html#contained.

When encoding XDS identifiers into FHIR Resource data elements of type Identifier, the FHIR notation of OIDs and UUIDs uses the system identifier of “urn:ietf:rfc:3986”. For more details and examples, see ITI TF-2x: Appendix E.3 “FHIR Identifier Type”.

#### DocumentEntry Metadata Attributes {#documentEntry}

Table 4.5.1.1-1 provides a mapping of Document Sharing DocumentEntry attributes to FHIR DocumentReference Resource elements. The full DocumentEntry metadata attribute definition is in ITI TF-3: 4.2.3.2. The optionality of elements is transaction-specific and is found in ITI TF-3: 4.3.1-3.

Note: FHIR contains an informative mapping that is intended to be equivalent to Table 4.5.1.1-1. The informative FHIR mapping can be found at http://hl7.org/fhir/R4/documentreference-mappings.html#xds.

TODO: Using FSH include mapping, and thus can just include the IG renderng of the mapping

##### DocumentReference StructureDefinition
The conformance requirements are different between a Provide Document Bundle [ITI-65] transaction and a Find Document References [ITI-67] transaction, and between Minimal Metadata and Comprehensive Metadata.

TODO: Point at the four structure definitions

The values for canonical profile URI for DocumentReference are:

In Provide Document Bundle [ITI-65]:
* Comprehensive Metadata: http://ihe.net/fhir/StructureDefinition/IHE_MHD_Provide_Comprehensive_DocumentReference
* Minimal Metadata: http://ihe.net/fhir/StructureDefinition/IHE_MHD_Provide_Minimal_DocumentReference 

In Find Document References [ITI-67]:
* Comprehensive Metadata: http://ihe.net/fhir/StructureDefinition/IHE_MHD_Query_Comprehensive_DocumentReference
* Minimal Metadata: http://ihe.net/fhir/StructureDefinition/IHE_MHD_Query_Minimal_DocumentReference 


Resources are not required to carry the meta.profile element and may only carry the profile element defined for the Provide Document Bundle [ITI-65] transaction, as the Receiver is not required to add the profile tags. The value of the meta.profile is a soft indicator of conformance expectation. Receivers may choose to validate actual conformance and fail transactions due to non-conformance.

#### SubmissionSet Metadata Attributes {#submissionSet}

Table 4.5.1.2-1 provides a mapping of the metadata attributes associated with a Document Sharing SubmissionSet object to FHIR List Resource. The full SubmissionSet metadata attribute definition is in Section 4.2.3.3.

TODO: Using FSH include mapping, and thus can just include the IG renderng of the mapping

##### SubmissionSet List StructureDefinition
The conformance requirements are different between Comprehensive and Minimal metadata and are identified by the following canonical URI values: 
* Comprehensive Metadata http://ihe.net/fhir/StructureDefinition/IHE_MHD_Comprehensive_DocumentManifest
* Minimal Metadata:         http://ihe.net/fhir/StructureDefinition/IHE_MHD_Minimal_DocumentManifest

TODO: adjust canonical URI 

Resources are not required to carry the meta.profile element and may only carry the profile element defined for the Provide Document Bundle [ITI-65] transaction, as the Receiver is not required to add the profile tags. The value of the meta.profile is a soft indicator of conformance expectation. Receivers may choose to validate actual conformance and fail transactions due to non-conformance.

#### Folder Metadata Attributes {#folder}
Table 4.5.1.3-1 provides a mapping of the metadata attributes associated with a Document Sharing Folder object to a FHIR List Resource. The full Folder metadata attribute definition is in Section 4.2.3.4.

Note that FHIR List Resource in the FHIR specification does not include a Mapping to XDS.

TODO: Using FSH include mapping, and thus can just include the IG renderng of the mapping

##### Folder StructureDefinition
The conformance requirements are different between Comprehensive and Minimal metadata and are identified by the following canonical URI values:
*Comprehensive Metadata: 
http://ihe.net/fhir/StructureDefinition/IHE_MHD_Comprehensive_List
* Minimal Metadata: 
http://ihe.net/fhir/StructureDefinition/IHE_MHD_Minimal_List

Resources are not required to carry the meta.profile element and may only carry the profile element defined for the Provide Document Bundle [ITI-65] transaction, as the Receiver is not required to add the profile tags. The value of the meta.profile is a soft indicator of conformance expectation. Receivers may choose to validate actual conformance and fail transactions due to non-conformance.
