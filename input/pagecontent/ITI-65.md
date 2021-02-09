This section corresponds to transaction [ITI-65] of the IHE Technical Framework. Transaction [ITI-65] is used by the Document Source and Document Recipient Actors. The Provide Document Bundle [ITI-65] transaction is used to transmit a set of documents and associated metadata.

### Scope

The Provide Document Bundle [ITI-65] transaction passes a Provide Document Bundle Request from a Document Source to a Document Recipient.

### Actors Roles

**Table: Actor Roles**

|Actor | Role |
|-------------------+--------------------------|
| [Document Source](2_actors_and_transactions.html#document-source)    | Sends documents and metadata to the Document Recipient |
| [Document Recipient](2_actors_and_transactions.html#document-recipient) | Accepts the document and metadata sent from the Document Source |

### Referenced Standards

**FHIR-R4** [HL7 FHIR Release 4.0](http://www.hl7.org/FHIR/R4)

### Interactions

<div>
{%include ITI-65-seq.svg%}
</div>

<div style="clear: left"/>

**Figure: Provide Document Bundle Interactions**


#### Provide Document Bundle Request Message
This message uses the HTTP POST method on the target Provide Document Bundle endpoint to convey the metadata and the document(s) as a FHIR transaction.

##### Trigger Events

This method is invoked when the Document Source needs to submit one or more documents to a Document Recipient. 

##### Message Semantics

The Document Source shall initiate a FHIR “transaction” using a “create” action by sending an HTTP POST request method composed of a FHIR Bundle Resource containing the SubmissionSet type List Resource, one or more DocumentReference Resources, zero or more Folder type List Resources, and zero or more Binary Resources to the Document Recipient. Refer to ITI TF-3: 4.5.1 for details on the FHIR Resources and how Document Sharing metadata attributes are mapped. 

The media type of the HTTP body shall be either application/fhir+json or application/fhir+xml.

See http://hl7.org/fhir/R4/http.html#transaction for complete requirements of a transaction. See http://hl7.org/fhir/R4/bundle-transaction.html for example of a transaction bundle.

The Provide Document Bundle message is sent to the base URL as defined in FHIR. See http://hl7.org/fhir/R4/http.html for the definition of “HTTP” access methods and “base”.

The Document Source shall assure all FHIR resource elements are consistent with the Document Sharing metadata requirements as specified for attributes ITI TF-3: Table 4.3.1-3 “Sending Actor Metadata Attribute Optionality”. The Document Source that supports the [Comprehensive Metadata](2_actors_and_transactions.html#xds-on-fhir-option) or the [XDS on FHIR](2_actors_and_transactions.html#xds-on-fhir-option) Options shall assure consistency with column “XDS DS”; otherwise, the Document Source shall assure consistency with column “XDR MS”. The Document Source shall not provide any entryUUID values.

###### Bundle Resources

For complete information on constructing a FHIR Bundle Resource, see http://hl7.org/fhir/R4/bundle.html

The FHIR Bundle.meta.profile shall have the following value depending on the use of Comprehensive metadata, Minimal metadata, or UnContained metadata: 
* [Comprehensive Metadata](StructureDefinition-IHE.MHD.Comprehensive.ProvideBundle.html): `http://ihe.net/fhir/ihe.mhd.fhir/StructureDefinition/IHE.MHD.Comprehensive.ProvideBundle`
  * shall be a Transaction Bundle
  * all resources may be marked comprehensive
  * all resources shall be compliant with comprehensive constraints
  * shall have a [SubmissionSet type List](StructureDefinition-IHE.MHD.Comprehensive.SubmissionSet.html)
  * may have one or more [DocumentReference](StructureDefinition-IHE.MHD.Comprehensive.DocumentReference.html)
  * may have one or more [Binary](http://hl7.org/fhir/R4/binary.html)
  * may have one or more [Folder type List](StructureDefinition-IHE.MHD.Comprehensive.Folder.html)
  * may have one [Patient](http://hl7.org/fhir/R4/patient.html)
* [Minimal Metadata](IHE_MHD_Provide_Minimal_DocumentBundle): `	http://ihe.net/fhir/ihe.mhd.fhir/StructureDefinition/IHE.MHD.Minimal.ProvideBundle`
  * shall be a Transaction Bundle
  * all resources may be marked minimal, comprehensive, or unContained
  * shall have a [SubmissionSet type List](StructureDefinition-IHE.MHD.Minimal.SubmissionSet.html)
  * may have one or more [DocumentReference](StructureDefinition-IHE.MHD.Minimal.DocumentReference.html)
  * may have one or more [Binary](http://hl7.org/fhir/R4/binary.html)
  * may have one or more [Folder type List](StructureDefinition-IHE.MHD.Minimal.Folder.html)
  * may have one [Patient](http://hl7.org/fhir/R4/patient.html)
* [UnContained Comprehensive Metadata](StructureDefinition-IHE.MHD.UnContained.Comprehensive.ProvideBundle.html) Bundle profile
  * Note that Minimal Metadata does not require containment, so UnContained Minimal is the same as Minimal Metadata
  * Note that UnContained only applies to DocumentReference and SubmissionSet type Lists; so the following apply
  * [Submission Set UnContained](StructureDefinition-IHE.MHD.UnContained.Comprehensive.SubmissionSet.html)
  * [DocumentReference UnContained](StructureDefinition-IHE.MHD.UnContained.Comprehensive.DocumentReference.html)

When resources are `contained` (see ITI TF-3: 4.5.1), they shall be contained using the FHIR contained method (see http://hl7.org/fhir/R4/references.html#contained).

When the DocumentReference.content.attachment.url points at a Binary Resource, the Binary Resource shall be in the Bundle. See FHIR Resolving references in Bundles at http://hl7.org/fhir/R4/bundle.html#references.

###### Patient Identity

All DocumentReference.subject, and List.subject values shall be References to a FHIR Patient Resource. This value may be a relative reference to a Patient Resource within the Bundle or an absolute external reference (URL). This value should be an absolute external reference that may be obtained through use of [PDQm](https://profiles.ihe.net/ITI/TF/Volume1/ch-38.html) or [PIXm](https://profiles.ihe.net/ITI/TF/Volume1/ch-41.html), or by some other means. The Patient Resource needs to be accessible to both the Document Source and the Document Recipient.

When the [UnContained Reference Option](2_actors_and_transactions.html#uncontained-reference-option) is used, there is no need to populate the sourcePatientInfo element. Otherwise, when sourcePatientInfo is provided, the DocumentReference.context.sourcePatientInfo shall be a reference to a “contained” Patient Resource. That is, the source patient info is encoded in a Patient Resource within the DocumentReference.contained element (see http://hl7.org/fhir/R4/references.html#contained).

###### Replace, Transform, Signs, and Append Associations

The DocumentReference.relatesTo element indicates an association between DocumentReference resources. The relatesTo.target element in the provided DocumentReference points at the pre-existing DocumentReference that is being replaced, transformed, signed, or appended. The relatesTo.code element in the provided DocumentReference shall be the appropriate relationship type code defined in http://hl7.org/fhir/R4/valueset-document-relationship-type.html. 

##### Expected Actions

The Document Recipient shall accept both media types `application/fhir+json` and `application/fhir+xml`.

On receipt of the submission, the Document Recipient shall validate the resources and respond with one of the HTTP codes defined in the response [Message Semantics](#message-semantics-1). 

The Document Recipient shall process the bundle atomically, analogous to both the Provide and Register Document Set-b [ITI-41] transaction and FHIR “transaction” as specified in http://hl7.org/fhir/R4/http.html#transaction . 

The Document Recipient shall validate the bundle first against the FHIR specification. Guidance on what FHIR considers a valid Resource can be found at http://hl7.org/fhir/R4/validation.html. 

The Document Recipient shall verify the FHIR resource elements for consistency with the Document Sharing metadata requirements as specified for attributes [ITI TF-3: Table 4.3.1-3: “Sending Actor Metadata Attribute Optionality”](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.3.html#4.3.1). The Document Recipient that supports the “Comprehensive Metadata” or the “XDS on FHIR” Option shall validate against column “XDS DS”; otherwise the Document Recipient shall validate against column “XDR MS”. 

If necessary for processing, the Document Recipient shall retrieve Resources referenced by absolute URLs in the FHIR Bundle Resource.

If the Document Recipient encounters any errors or if any validation fails, the Document Recipient shall return an error, as documented in [Provide Document Bundle Response Message](#provide-document-bundle-response-message). If appropriate, it shall use error codes from [ITI TF-3: Table 4.2.4.1-2](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.4.1).

If the Provide Document Bundle Message contains a DocumentReference Resource with a relatesTo element and the Document Recipient does not support the relatesTo.code value, it shall return a warning message, as indicated in *Table 3.65.4.1.3-1: Warning message when relatesTo code is not supported*.

*Table 3.65.4.1.3-1: Warning message when relatesTo code is not supported*

|relatesTo.code |	Warning |
|---------------|-----------|
|replaces	 | PartialReplaceContentNotProcessed |
|transforms	 | PartialTransformContentNotProcessed |
|appends	 | PartialAppendContentNotProcessed |

If the Provide Document Bundle Message contains a Folder type List Resource and the Document Recipient does not support the Folder type List Resource (aka, Folders), the Document Recipient shall either fail the whole transaction or may ignore the Folder type List, continuing processing of the transaction, and return a “PartialFolderContentNotProcessed” warning. 

###### XDS on FHIR Option

The MHD Document Recipient is grouped with an XDS Document Source when it supports the [XDS on FHIR Option](2_actors_and_transactions.html#xds-on-fhir-option) Option. The Document Recipient shall transform the Bundle content into a proper message for the Provide and Register Document Set-b [ITI-41](https://profiles.ihe.net/ITI/TF/Volume2/ITI-41.html) transaction. The Document Recipient shall create appropriate metadata from Resources in the FHIR Bundle Resource, including SubmissionSet, DocumentEntry, and Associations. 

If the Provide Document Bundle Message contains a DocumentReference with a relatesTo element that has a code equal to "replaces" (as defined in http://hl7.org/fhir/R4/valueset-document-relationship-type.html), the XDS Document Source shall include a corresponding RPLC Association in the Submission Set for the Provide and Register Document Set-b [ITI-41](https://profiles.ihe.net/ITI/TF/Volume2/ITI-41.html) transaction. 

If the Provide Document Bundle Message contains a DocumentReference with a relatesTo element that has a code equal to "transforms", the XDS Document Source shall include a corresponding XFRM Association in the Submission Set for the Provide and Register Document Set-b [ITI-41](https://profiles.ihe.net/ITI/TF/Volume2/ITI-41.html) transaction. 

If the Provide Document Bundle Message contains a DocumentReference with a relatesTo element that has a code equal to "appends", the XDS Document Source shall include a corresponding APND Association in the Submission Set for the Provide and Register Document Set-b [ITI-41](https://profiles.ihe.net/ITI/TF/Volume2/ITI-41.html) transaction.

The Document Recipient shall map Folder type List Resources in the Bundle Resource to XDS Folders, as specified in [ITI TF-3: Table 4.5.1.1-1](metadata_maps.html#folder).

Some FHIR elements do not translate to XDS concepts; the handling of these elements is left to the implementer of the Document Recipient. 

Upon successful conversion of the FHIR Bundle to XDS Document Sharing metadata, the grouped Document Source shall execute the Provide and Register Document Set-b [ITI-41](https://profiles.ihe.net/ITI/TF/Volume2/ITI-41.html) transaction. The transaction result, and any error or warning messages, shall be reported to the MHD Document Source. The Document Recipient is responsible for translating the XDS response to the appropriate HTTP Status Code and FHIR OperationOutcome Resource in the Provide Document Bundle Response Message.

#### Provide Document Bundle Response Message

The Document Recipient returns a HTTP Status code appropriate to the processing outcome, conforming to the transaction specification requirements as specified in http://hl7.org/fhir/R4/http.html#transaction 

##### Trigger Events

This message shall be sent when a success or error condition needs to be communicated. Success is only indicated once the document(s) is/are received and completely processed and persisted as appropriate to the Document Recipient Actor configuration. 

##### Message Semantics

To enable the Document Source to know the outcome of processing the transaction, and the identities assigned to the resources by the Document Recipient, the Document Recipient shall return a Bundle, with type set to transaction-response, that contains one entry for each entry in the request, in the same order as received, with the Bundle.entry.response.outcome indicating the results of processing the entry warnings such as PartialFolderContentNotProcessed shall be reported in `Bundle.entry.response.outcome`. The Document Recipient shall comply with FHIR http://hl7.org/fhir/R4/bundle.html#transaction-response and http://hl7.org/fhir/R4/http.html#transaction-response. 

To indicate success the overall http `200` response is used. The Bundle.entry.response.status shall be `201` to indicate the Resource has been created; the `.location` element shall be populated, and the `.etag` element may be populated when the Document Recipient supports FHIR resource versioning.

##### Expected Actions

If the Document Recipient returns an HTTP redirect response (HTTP status codes 301, 302, 303, or 307), the Document Source shall follow the redirect, but may stop processing if it detects a loop. See [RFC7231 Section 6.4 Redirection 3xx](https://tools.ietf.org/html/rfc7231#section-6.4).

The Document Source processes the results according to application-defined rules.	

### CapabilityStatement Resource

Document Recipient implementing this transaction shall provide a CapabilityStatement Resource as described in [ITI TF-2x: Appendix Z.3](appendix_z.html#capability) indicating the transaction has been implemented. 
* Requirements CapabilityStatement for [Document Source](CapabilityStatement-IHE.MHD.DocumentSource.html)
* Requirements CapabilityStatement for [Document Recipient](CapabilityStatement-IHE.MHD.DocumentRecipient.html)

### Security Considerations

See [MHD Security Considerations](3_security_considerations.html)

#### Security Audit Considerations

The security audit criteria are similar to those for the Provide and Register Document Set-b [ITI-41](https://profiles.ihe.net/ITI/TF/Volume2/ITI-41.html) transaction as this transaction does export a document. Grouping a Document Source or Document Recipient with an ATNA Secure Node or Secure Application is recommended, but not mandated. 

##### Document Source Audit 

The Document Source when grouped with ATNA Secure Node or Secure Application actor shall be able to record a [Provide Audit Bundle Source Audit Event Log](StructureDefinition-IHE.MHD.ProvideBundle.Audit.Source.html). [Audit Example for a Provide Bundle Transaction from source perspective](AuditEvent-ex-auditProvideBundle-source.html) 

##### Document Recipient Audit 

The Document Recipient when grouped with ATNA Secure Node or Secure Application actor shall be able to record a [Provide Audit Bundle Recipient Audit Event Log](StructureDefinition-IHE.MHD.ProvideBundle.Audit.Recipient.html). [Audit Example for a Provide Bundle Transaction from recipient perspective](AuditEvent-ex-auditProvideBundle-recipient.html) 
