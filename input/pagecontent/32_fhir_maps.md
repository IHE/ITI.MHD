
| Editor, please Add Section 4.5 |
{: .grid}

## 3:4.5 FHIR Representation of Document Sharing Metadata

This section documents the mapping between IHE [Document Sharing Metadata](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.1.html#4.1) and the FHIR Resources.

### 3:4.5.1 Metadata Object Types mapped to FHIR

For details on FHIR resources and data types see HL7 FHIR [FHIR index.html]({{site.data.fhir.path}}index.html).

Some Document Sharing Metadata attributes must be treated as `contained` FHIR Resources. These are indicated in with a "Note 1” and the word `contained`. The details of the FHIR `contained` mechanism is found at [FHIR references.html#contained]({{site.data.fhir.path}}references.html#contained).

When encoding XDS identifiers into FHIR Resource data elements of type Identifier, the FHIR notation of OIDs and UUIDs uses the system identifier of `urn:ietf:rfc:3986`. For more details and examples, see [ITI TF-2: Appendix E.3 “FHIR Identifier Type”](https://profiles.ihe.net/ITI/TF/Volume2/ch-E.html#E.3).

#### 3:4.5.1.1 DocumentEntry Metadata Attributes {#documentEntry}

The documented [mapping of the metadata elements](StructureDefinition-IHE.MHD.Minimal.DocumentReference-mappings.html) associated with a [Document Sharing DocumentEntry object](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2) attributes.

The mapping in table form

| [DocumentEntry](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2)         | [R4 DocumentReference](https://hl7.org/fhir/R4/documentreference.html) | [R5 DocumentReference](https://hl7.org/fhir/R5/documentreference.html) |
|-----------------------|-------------------------------|-----------------------------------|
| limitedMetadata       | meta.profile                  | meta.profile                      |
| uniqueId              | masterIdentifier              | identifier (uniqueId)             |
| entryUUID             | identifier                    | identifier (entryUUID)            |
| availabilityStatus    | status                        | status                            |
| typeCode              | type                          | type                              |
| classCode             | category                      | category                          |
| patientId             | subject                       | subject                           |
| author                | author                        | author                            |
| legalAuthenticator    | authenticator                 | attester                          |
| Associations          |                               |                                   |
|  .type                | relatesTo.code                | relatesTo.code                    |
|  .reference           | relatesTo.target              | relatesTo.target                  |
| comments              | description                   | description                       |
| confidentialityCode   | securityLabel                 | securityLabel                     |
| mimeType              | content.attachment.contentType | content.attachment.contentType   |
| languageCode          | content.attachment.language   | content.attachment.language       |
| repositoryUniqueId    | content.attachment.url        | content.attachment.url            |
| URI                   | content.attachment.url        | content.attachment.url            |
| size                  | content.attachment.size       | content.attachment.size           |
| hash                  | content.attachment.hash       | content.attachment.hash           |
| title                 | content.attachment.title      | content.attachment.title          |
| creationTime          | content.attachment.creation   | content.attachment.creation       |
| formatCode            | content.format                | content.profile.valueCoding       |
| referenceIdList       |                               |                                   |
| ... type encounterId  | context.encounter             | context                           |
| ... procedures        | context.related               | basedOn                           |
| ... all other         | context.related               | event.reference                   |
| eventCodeList         | context.event                 | event.concept                     |
| serviceStartTime      | context.period.start          | period.start                      |
| serviceStopTime       | context.period.end            | period.end                        |
| healthcareFacilityTypeCode | context.facilityType     | facilityType                      |
| practiceSettingCode   | context.practiceSettingCode   | practiceSetting                   |
| sourcePatientInfo     | sourcePatientInfo.reference   | extension ([sourcePatient](https://hl7.org/fhir/extensions/StructureDefinition-documentreference-sourcepatient.html))         |
| sourcePatientId       | sourcePatientInfo.identifier  | extension ([sourcePatient](https://hl7.org/fhir/extensions/StructureDefinition-documentreference-sourcepatient.html))         |
{: .grid}

Note: FHIR contains an informative mapping that is intended to be equivalent and can be found at [FHIR documentReference XDS mapping]({{site.data.fhir.path}}documentreference-mappings.html#xds). For the purposes of IHE MHD conformance the mapping documented here (in IHE) are normative.

#### 3:4.5.1.2 DocumentReference StructureDefinition

The conformance requirements are different between a Provide Document Bundle [ITI-65](ITI-65.html) transaction and a Find Document References [ITI-67](ITI-67.html) transaction, and between Minimal Metadata, Comprehensive Metadata, and UnContained References.

The conformance requirements are different between Comprehensive, minimal, and UnContained References. The canonical URI is found as the "Defining URL:":

* [Comprehensive DocumentReference Metadata](StructureDefinition-IHE.MHD.Comprehensive.DocumentReference.html)
* [Comprehensive DocumentReference UnContained References](StructureDefinition-IHE.MHD.UnContained.Comprehensive.DocumentReference.html)
* [Minimal DocumentReference Metadata](StructureDefinition-IHE.MHD.Minimal.DocumentReference.html)
* Minimal DocumentReference does not include `contained` requirements

Resources are not required to carry the meta.profile element and may only carry the profile element defined for the Provide Document Bundle [ITI-65] transaction, as the Receiver is not required to add the profile tags. The value of the meta.profile is a soft indicator of conformance expectation. Receivers may choose to validate actual conformance and fail transactions due to non-conformance.

### 3:4.5.2 SubmissionSet Metadata Attributes {#submissionSet}

The documented [mapping of the metadata elements](StructureDefinition-IHE.MHD.Minimal.SubmissionSet-mappings.html) associated with a [Document Sharing SubmissionSet object](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.3) attributes.

| [SubmissionSet](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.3) | [R4 List](https://hl7.org/fhir/R4/list.html) | [R5 List](https://hl7.org/fhir/R5/list.html) |
|-----------------------|-------------------------------|-------------------------------|
| limitedMetadata       | meta.profile                  | meta.profile                  |
| contentTypeCode       | extension (designationType)   | extension (designationType)   |
| sourceId              | extension (sourceId)          | extension (sourceId)          |
| intendedRecipient     | extension (intendedRecipient) | extension (intendedRecipient) |
| entryUUID             | identifier                    | identifier                    |
| uniqueId              | identifier                    | identifier                    |
| availabilityStatus    | status                        | status                        |
| title                 | title                         | title                         |
| patientId             | subject                       | subject                       |
| submissionTime        | date                          | date                          |
| author                |                               |                               |
|   when Organization   | extension (authorOrg)         | extension (authorOrg)         |
|   when Practitioner   | source                        | source                        |
| comments              | note                          | note                          |
| DocumentEntry(s)      | entry.item                    | entry.item                    |
| Folder(s)             | entry.item                    | entry.item                    |
{: .grid}

#### 3:4.5.2.1 SubmissionSet List StructureDefinition

The conformance requirements are different between Comprehensive, Minimal, and UnContained References. The canonical URI is found as the "Defining URL:":

* [Comprehensive SubmissionSet Metadata](StructureDefinition-IHE.MHD.Comprehensive.SubmissionSet.html)
* [Comprehensive SubmissionSet UnContained References](StructureDefinition-IHE.MHD.UnContained.Comprehensive.SubmissionSet.html)
* [Minimal SubmissionSet Metadata](StructureDefinition-IHE.MHD.Minimal.SubmissionSet.html)
* Minimal SubmissionSet Metadata does not include `contained` requirements

Resources are not required to carry the meta.profile element and may only carry the profile element defined for the Provide Document Bundle [ITI-65](ITI-65.html) transaction, as the Receiver is not required to add the profile tags. The value of the meta.profile is a soft indicator of conformance expectation. Receivers may choose to validate actual conformance and fail transactions due to non-conformance.

### 3:4.5.3 Folder Metadata Attributes {#folder}

The documented [mapping of the metadata elements](StructureDefinition-IHE.MHD.Minimal.Folder-mappings.html) associated with a [Document Sharing Folder object](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.4) attributes.

Note that FHIR List Resource in the FHIR core specification does not include a Mapping to XDS.

| [Folder](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.4) | [R4 List](https://hl7.org/fhir/R4/list.html) | [R5 List](https://hl7.org/fhir/R5/list.html) |
|-----------------------|-------------------------------|-------------------------------|
| limitedMetadata       | meta.profile                  | meta.profile                  |
| contentTypeCode       | extension (designationType)   | extension (designationType)   |
| entryUUID             | identifier                    | identifier                    |
| uniqueId              | identifier                    | identifier                    |
| availabilityStatus    | status                        | status                        |
| title                 | title                         | title                         |
| patientId             | subject                       | subject                       |
| lastUpdateTime        | date                          | date                          |
| comments              | note                          | note                          |
| DocumentEntry(s)      | entry.item                    | entry.item                    |
{: .grid}

#### 3:4.5.3.1 Folder StructureDefinition

The conformance requirements are different between Comprehensive and Minimal metadata. The canonical URI is found as the "Defining URL:":

* [Comprehensive Folder Metadata](StructureDefinition-IHE.MHD.Comprehensive.Folder.html)
* Comprehensive Folder Metadata does not include `contained` requirements
* [Minimal Folder Metadata](StructureDefinition-IHE.MHD.Minimal.Folder.html)
* Minimal Folder Metadata does not include `contained` requirements

Resources are not required to carry the meta.profile element and may only carry the profile element defined for the Provide Document Bundle [ITI-65](ITI-65.html) transaction, as the Receiver is not required to add the profile tags. The value of the meta.profile is a soft indicator of conformance expectation. Receivers may choose to validate actual conformance and fail transactions due to non-conformance.

