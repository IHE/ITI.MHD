This section corresponds to transaction [ITI-65] of the IHE Technical Framework. Transaction [ITI-65] is used by the Document Source and Document Recipient Actors. The Provide Document Bundle [ITI-65] transaction is used to transmit a set of documents and associated metadata.

### 2:3.65.1 Scope

The Provide Document Bundle [ITI-65] transaction passes a Provide Document Bundle Request from a Document Source to a Document Recipient.

### 2:3.65.2 Actors Roles

**Table 2:3.65.2-1: Actor Roles**

|Actor | Role |
|-------------------+--------------------------|
| [Document Source](1331_actors_and_transactions.html#133111-document-source)    | Sends documents and metadata to the Document Recipient |
| [Document Recipient](1331_actors_and_transactions.html#133113-document-recipient) | Accepts the document and metadata sent from the Document Source |
{: .grid}

### 2:3.65.3 Referenced Standards

**FHIR-R4** [HL7 FHIR Release 4.0](http://www.hl7.org/FHIR/R4)

### 2:3.65.4 Messages

<div>
{%include ITI-65-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:3.65.4-1: Provide Document Bundle Interactions**

#### 2:3.65.4.1 Provide Document Bundle Request Message
This message uses the HTTP POST method on the target Provide Document Bundle endpoint to convey the metadata and the document(s) as a FHIR transaction.

##### 2:3.65.4.1.1 Trigger Events

This method is invoked when the Document Source needs to submit one or more documents to a Document Recipient. 

##### 2:3.65.4.1.2 Message Semantics

The Document Source shall initiate a FHIR “transaction” using a “create” action by sending an HTTP POST request method composed of a FHIR Bundle Resource containing: one SubmissionSet type List Resource; one or more DocumentReference Resources; zero or more Folder type List Resources; and zero or more Binary Resources to the Document Recipient. Refer to [ITI TF-3: 4.5.1](32_fhir_maps.html) for details on the FHIR Resources and how Document Sharing metadata attributes are mapped. 

The media type of the HTTP body shall be either `application/fhir+json` or `application/fhir+xml`.

See [http://hl7.org/fhir/R4/http.html#transaction](http://hl7.org/fhir/R4/http.html#transaction) for complete requirements of a transaction. See [http://hl7.org/fhir/R4/bundle-transaction.html](http://hl7.org/fhir/R4/bundle-transaction.html) for example of a transaction bundle.

The Provide Document Bundle message is sent to the base URL as defined in FHIR. See [http://hl7.org/fhir/R4/http.html](http://hl7.org/fhir/R4/http.html) for the definition of “HTTP” access methods and “base”.

The Document Source shall assure all FHIR resource elements are consistent with the [Document Sharing metadata](https://profiles.ihe.net/ITI/TF/Volume3/index.html#4) requirements as specified for attributes [ITI TF-3: Table 4.3.1-3 “Sending Actor Metadata Attribute Optionality”](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.3.html#4.3.1). The Document Source that supports the [Comprehensive Metadata](1332_actor_options.html#13322-xds-on-fhir-option) or the [XDS on FHIR](1332_actor_options.html#13322-xds-on-fhir-option) Options shall assure consistency with column “XDS DS”; otherwise, the Document Source shall assure consistency with column “XDR MS”. The Document Source shall not provide any entryUUID values.

###### 2:3.65.4.1.2.1 Bundle Resources

For complete information on constructing a FHIR Bundle Resource, see [http://hl7.org/fhir/R4/bundle.html](http://hl7.org/fhir/R4/bundle.html)

The FHIR Bundle.meta.profile shall have the following value depending on the Actor implementation of no options (Minimal Metadata), Comprehensive Metadata Option, or UnContained References Option: 
- [Minimal Metadata](StructureDefinition-IHE.MHD.Minimal.ProvideBundle.html): `http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.ProvideBundle`
  - shall be a Transaction Bundle
  - all resources shall be compliant with minimal constraints, they may be marked minimal, comprehensive, or unContained
  - shall create a [SubmissionSet type List](StructureDefinition-IHE.MHD.Minimal.SubmissionSet.html) that is either minimal, comprehensive, or unContained
  - may create one or more [DocumentReference](StructureDefinition-IHE.MHD.Minimal.DocumentReference.html) that is either minimal, comprehensive, or unContained
  - may create one or more [Binary](http://hl7.org/fhir/R4/binary.html)
  - may create/update one or more [Folder type List](StructureDefinition-IHE.MHD.Minimal.Folder.html) that is either minimal, comprehensive, or unContained
  - may create/update/read one [Patient](http://hl7.org/fhir/R4/patient.html)
- [Comprehensive Metadata](StructureDefinition-IHE.MHD.Comprehensive.ProvideBundle.html): `http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.ProvideBundle`
  - this is otherwise known as XDS-on-FHIR
  - shall be a Transaction Bundle
  - all resources shall be compliant with comprehensive constraints, they may be marked comprehensive
  - shall create a [SubmissionSet type List](StructureDefinition-IHE.MHD.Comprehensive.SubmissionSet.html) that is comprehensive
  - may create one or more [DocumentReference](StructureDefinition-IHE.MHD.Comprehensive.DocumentReference.html) that is comprehensive
  - may create one or more [Binary](http://hl7.org/fhir/R4/binary.html)
  - may create/update one or more [Folder type List](StructureDefinition-IHE.MHD.Comprehensive.Folder.html) that is comprehensive
  - may create/update/read one [Patient](http://hl7.org/fhir/R4/patient.html)
- [UnContained Comprehensive Metadata](StructureDefinition-IHE.MHD.UnContained.Comprehensive.ProvideBundle.html): `http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.UnContained.Comprehensive.ProvideBundle` 
  - note that Minimal Metadata does not require containment, so UnContained Minimal is the same as Minimal Metadata
  - note that UnContained only applies to DocumentReference and SubmissionSet type Lists; so the following apply
  - shall be a Transaction Bundle
  - all resources shall be compliant with comprehensive unContained constraints, they may be marked comprehensive unContained
  - shall create a [SubmissionSet type List](StructureDefinition-IHE.MHD.UnContained.Comprehensive.SubmissionSet.html) that is comprehensive or unContained
  - may create one or more [DocumentReference](StructureDefinition-IHE.MHD.UnContained.Comprehensive.DocumentReference.html) that is comprehensive or unContained
  - may create one or more [Binary](http://hl7.org/fhir/R4/binary.html)
  - may create/update one or more [Folder type List](StructureDefinition-IHE.MHD.Comprehensive.Folder.html) that is comprehensive
  - may create/update/read one [Patient](http://hl7.org/fhir/R4/patient.html)

When resources are `contained` , see [ITI TF-3: 4.5.1](32_fhir_maps.html), they shall be contained using the FHIR contained method (see [http://hl7.org/fhir/R4/references.html#contained](http://hl7.org/fhir/R4/references.html#contained) ).

When the DocumentReference.content.attachment.url points at a Binary Resource, the Binary Resource shall be in the Bundle. See FHIR Resolving references in Bundles at [http://hl7.org/fhir/R4/bundle.html#references](http://hl7.org/fhir/R4/bundle.html#references). 

The Document Source shall populate accurate .hash and .size for the document content: 
* Where the document content is a Binary Resource instance, the .hash and .size measure the raw artifact that has been base64encoded in the Binary.data element.  
* Where the document content is hosted elsewhere, not as a Binary Resource, the .hash and the .size shall represent the document content that would be retrieved using the mime-type specified in contentType element. 
* Where the document content is [On-Demand Document Option](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.2.7), the .hash and the .size shall be absent from the DocumentReference Resource. See On-Demand Document [Use Cases Summary](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.4.11.3). 
* Where the document content is [Delayed Document Assembly](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.2.10), the .size of `0` (zero), and the .hash with the fixed value `da39a3ee5e6b4b0d3255bfef95601890afd80709` (SHA1 hash of a zero length file).

Folders may be created or updated. A Document Recipient may require that an Updated Folder only have new .entry elements added as would be the requirement of XDS.

Patient would typically only be allowed by the Document Recipient in PUSH interaction situations, but may be accepted for other reasons at the discretion of the Document Recipient actor policy.

###### 2:3.65.4.1.2.2 Patient Identity

All DocumentReference.subject, and List.subject values shall be References to a FHIR Patient Resource that may be obtained through use of [PDQm](https://profiles.ihe.net/ITI/TF/Volume1/ch-38.html), [PIXm](https://profiles.ihe.net/ITI/TF/Volume1/ch-41.html), or by some other means. If the Patient Resource is accessible to both the Document Source and Document Recipient via an external reference, it shall be included as an external reference. Otherwise, the Patient Resource shall be included in the Bundle.

When the [UnContained Reference Option](1332_actor_options.html#13323-uncontained-reference-option) is used, there is no need to populate the sourcePatientInfo element. Otherwise, when sourcePatientInfo is provided, the DocumentReference.context.sourcePatientInfo shall be a reference to a “contained” Patient Resource. That is, the source patient info is encoded in a Patient Resource within the DocumentReference.contained element (see [http://hl7.org/fhir/R4/references.html#contained](http://hl7.org/fhir/R4/references.html#contained) ).

###### 2:3.65.4.1.2.3 Replace, Transform, Signs, and Append Associations

The DocumentReference.relatesTo element indicates an association between DocumentReference resources. The relatesTo.target element in the provided DocumentReference points at the pre-existing DocumentReference that is being replaced, transformed, signed, or appended. The relatesTo.code element in the provided DocumentReference shall be the appropriate relationship type code defined in [http://hl7.org/fhir/R4/valueset-document-relationship-type.html](http://hl7.org/fhir/R4/valueset-document-relationship-type.html). 

##### 2:3.65.4.1.3 Expected Actions

The Document Recipient shall accept both media types `application/fhir+json` and `application/fhir+xml`.

On receipt of the submission, the Document Recipient shall validate the resources and respond with one of the HTTP codes defined in the response [Message Semantics](#2365412-message-semantics). 

The Document Recipient shall process the bundle atomically, analogous to both the Provide and Register Document Set-b [ITI-41] transaction and FHIR “transaction” as specified in [http://hl7.org/fhir/R4/http.html#transaction](http://hl7.org/fhir/R4/http.html#transaction). 

The Document Recipient shall validate the bundle first against the FHIR specification. Guidance on what FHIR considers a valid Resource can be found at [http://hl7.org/fhir/R4/validation.html](http://hl7.org/fhir/R4/validation.html). 

The Document Recipient should verify the FHIR resource elements for consistency with the Document Sharing metadata requirements as specified for attributes [ITI TF-3: Table 4.3.1-3: “Sending Actor Metadata Attribute Optionality”](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.3.html#4.3.1). 
- The Document Recipient that supports the [Comprehensive Metadata](1332_actor_options.html#13322-xds-on-fhir-option) or the [XDS on FHIR](1332_actor_options.html#13322-xds-on-fhir-option) Option should validate against column “XDS DS”; 
- Otherwise the Document Recipient should validate against column “XDR MS”.  

A Document Recipient is allowed to be robust for non-compliant resources that violate the the Document Sharing metadata requirements. 

If necessary for processing, the Document Recipient shall retrieve Resources referenced by absolute URLs in the FHIR Bundle Resource.

If the Document Recipient encounters any errors or if any validation fails, the Document Recipient shall return an error, as documented in [Provide Document Bundle Response Message](#236542-provide-document-bundle-response-message). If appropriate, it shall use error codes from [ITI TF-3: Table 4.2.4.1-2](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.4.1).

If the Provide Document Bundle Message contains a DocumentReference Resource with a relatesTo element and the Document Recipient does not support the relatesTo.code value given, it shall return a warning message, as indicated in *Table 2:3.65.4.1.3-1: Warning message when relatesTo code is not supported*.

**Table 2:3.65.4.1.3-1: Warning message when relatesTo code is not supported**

|relatesTo.code |	Warning |
|---------------|-----------|
|replaces	 | PartialReplaceContentNotProcessed |
|transforms	 | PartialTransformContentNotProcessed |
|appends	 | PartialAppendContentNotProcessed |
{: .grid}

If the Provide Document Bundle Message contains a Folder type List Resource and the Document Recipient does not support the Folder type List Resource (aka, Folders), the Document Recipient shall either fail the whole transaction or may ignore the Folder type List, continuing processing of the transaction, and return a “PartialFolderContentNotProcessed” warning. 

If the SubmissionSet `intendedRecipient` is populated, the Document Recipient SHALL make reasonable efforts to determine whether each recipient can be notified, but MAY return success before confirming full receipt and processing by the intendedRecipients. A Document Recipient MAY delegate notification of some or all intendedRecipients, for example, by grouping with an XCDR Initiating Gateway that pushes to XCDR Responding Gateways. If notification of an intendedRecipient is not possible, the Document Recipient MAY do any of the following (the Error/Warning codes are defined in section [3:4.2.4.1](31_xds.html#34241-registryerror-element)):
- Fail the transaction and return the code `UnknownRecipient` or `UnavailableRecipient` as an error
- Succeed and return the code `UnknownRecipient` or `UnavailableRecipient` as a warning
- Succeed silently

If the recipient is known to be an XDR/XCDR community, the error codes `XDSUnknownCommunity` or `XDSUnavailableCommunity` may be used instead.

###### 2:3.65.4.1.3.1 Grouping with Actors in other Document Sharing Profiles

This section applies to grouping MHD Document Recipient with [XDS](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html) [Document Source](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.1.1) Actor, [XDR](https://profiles.ihe.net/ITI/TF/Volume1/ch-15.html) Document Source Actor, [XDR](https://profiles.ihe.net/ITI/TF/Volume1/ch-15.html) Limited-Metadata Document Source Actor, and [XDM](https://profiles.ihe.net/ITI/TF/Volume1/ch-16.html) Portable Media Creator Actor (e.g. with the [XDM ZIP over Email Option](https://profiles.ihe.net/ITI/TF/Volume1/ch-16.html#16.2.3) ). 

The Document Recipient shall transform the Bundle content into a proper message for the Given grouped Actor (e.g. the XDS Document Source using the Provide and Register Document Set-b [ITI-41](https://profiles.ihe.net/ITI/TF/Volume2/ITI-41.html) transaction). The Document Recipient shall create appropriate metadata from Resources in the FHIR Bundle Resource, including SubmissionSet, DocumentEntry, Folder, and Associations. 

If the Provide Document Bundle Message contains a DocumentReference with a relatesTo element, the code shall be translated using the [AssociationType vs RelatesTo ConceptMap](ConceptMap-AssociationTypeVsRelatesTo.html).

The Document Recipient shall map Folder type List Resources in the Bundle Resource to XDS Folders, as specified in [ITI TF-3: 4.5.1.1](32_fhir_maps.html#folder). The Document Registry may apply further constraints on Folder content and revision, for example removal of entries from Folders is not generally allowed.

Some FHIR elements do not translate to XDS concepts; the handling of these elements is left to the implementer of the Document Recipient. 

Upon successful conversion of the FHIR Bundle to XDS Document Sharing metadata, the grouped source actor shall execute the appropriate transaction. The transaction result, and any error or warning messages, shall be reported to the MHD Document Source. The Document Recipient is responsible for translating the response to the appropriate HTTP Status Code and FHIR OperationOutcome Resource in the Provide Document Bundle Response Message.

#### 2:3.65.4.2 Provide Document Bundle Response Message

The Document Recipient returns a HTTP Status code appropriate to the processing outcome, conforming to the transaction specification requirements as specified in [http://hl7.org/fhir/R4/http.html#transaction](http://hl7.org/fhir/R4/http.html#transaction). 

##### 2:3.65.4.2.1 Trigger Events

This message shall be sent when a success or error condition needs to be communicated. Success is only indicated once the document(s) is/are received and completely processed and persisted as appropriate to the Document Recipient Actor configuration. 

##### 2:3.65.4.2.2 Message Semantics

To enable the Document Source to know the outcome of processing the transaction, and the identities assigned to the resources by the Document Recipient, the Document Recipient shall return a Bundle, with `type` set to `transaction-response`, that contains one entry for each entry in the request, in the same order as received, with the `Bundle.entry.response.outcome` indicating the results of processing the entry warnings such as PartialFolderContentNotProcessed. The Document Recipient shall comply with FHIR [http://hl7.org/fhir/R4/bundle.html#transaction-response](http://hl7.org/fhir/R4/bundle.html#transaction-response) and [http://hl7.org/fhir/R4/http.html#transaction-response](http://hl7.org/fhir/R4/http.html#transaction-response). 

To indicate success the overall http `200` response is used. The `Bundle.entry.response.status` shall be `201` to indicate the Resource has been created, the `.location` element shall be populated, and the `.etag` element may be populated when the Document Recipient supports FHIR resource versioning.

An informative StructureDefinition is outlined for [MHD Provide Bundle Document Response Message](StructureDefinition-IHE.MHD.ProvideDocumentBundleResponse.html), with an [example](StructureDefinition-IHE.MHD.ProvideDocumentBundleResponse-examples.html).

##### 2:3.65.4.2.3 Expected Actions

If the Document Recipient returns an HTTP redirect response (HTTP status codes 301, 302, 303, or 307), the Document Source shall follow the redirect, but may stop processing if it detects a loop. See [RFC7231 Section 6.4 Redirection 3xx](https://tools.ietf.org/html/rfc7231#section-6.4).

The Document Source processes the results according to application-defined rules.	

#### 2:3.65.4.3 CapabilityStatement Resource

Document Recipient shall provide a CapabilityStatement Resource as described in [ITI TF-2x: Appendix Z.3](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.3-capabilitystatement-resource) indicating the transaction has been implemented. 
* General Requirements CapabilityStatement for [Document Recipient](CapabilityStatement-IHE.MHD.DocumentRecipient.html). This indicates that either no options are declared or that all options are declared.
* Requirements CapabilityStatement for [Document Recipient Comprehensive Metadata Option](CapabilityStatement-IHE.MHD.DocumentRecipient.Comprehensive.html). This indicates that the Comprehensive Metadata Option is declared. Note that XDS-on-FHIR Option requires Comprehensive and thus this Requirements CapabilityStatement applies to XDS-on-FHIR also.
* Requirements CapabilityStatement for [Document Recipient UnContained References Option](CapabilityStatement-IHE.MHD.DocumentRecipient.UnContained.html). This indicates that the UnContained Option is declared.

Document Source should provide a CapabilityStatement Resource as described in [ITI TF-2x: Appendix Z.3](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.3-capabilitystatement-resource) indicating the transaction has been implemented. 
* General Requirements CapabilityStatement for [Document Source](CapabilityStatement-IHE.MHD.DocumentSource.html). This indicates that either no options are declared or that all options are declared.
* Requirements CapabilityStatement for [Document Source Comprehensive Metadata Option](CapabilityStatement-IHE.MHD.DocumentSource.Comprehensive.html). This indicates that the Comprehensive Metadata Option is declared. Note that XDS-on-FHIR Option requires Comprehensive and thus this Requirements CapabilityStatement applies to XDS-on-FHIR also.
* Requirements CapabilityStatement for [Document Source UnContained References Option](CapabilityStatement-IHE.MHD.DocumentSource.UnContained.html). This indicates that the UnContained Option is declared.


### 2:3.65.5 Security Considerations

See [MHD Security Considerations](1335_security_considerations.html)

#### 2:3.65.5.1 Security Audit Considerations

The security audit criteria are similar to those for the Provide and Register Document Set-b [ITI-41](https://profiles.ihe.net/ITI/TF/Volume2/ITI-41.html) transaction as this transaction does export a document.

##### 2:3.65.5.1.1 Document Source Audit 

The Document Source when grouped with ATNA Secure Node or Secure Application actor shall be able to record a [Provide Audit Bundle Source Audit Event Log](StructureDefinition-IHE.MHD.ProvideBundle.Audit.Source.html). [Audit Example for a Provide Bundle Transaction from source perspective](AuditEvent-ex-auditProvideBundle-source.html). 

##### 2:3.65.5.1.2 Document Recipient Audit 

The Document Recipient when grouped with ATNA Secure Node or Secure Application actor shall be able to record a [Provide Audit Bundle Recipient Audit Event Log](StructureDefinition-IHE.MHD.ProvideBundle.Audit.Recipient.html). [Audit Example for a Provide Bundle Transaction from recipient perspective](AuditEvent-ex-auditProvideBundle-recipient.html). 
