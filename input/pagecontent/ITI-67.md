This section corresponds to transaction [ITI-67] of the IHE Technical Framework. Transaction [ITI-67] is used by the Document Consumer and Document Responder Actors.

### 2:3.67.1 Scope

The Find Document References transaction is used to find DocumentReference Resources that satisfy a set of parameters. It is equivalent to the FindDocuments and FindDocumentsByReferenceId queries from the Registry Stored Query [ITI-18] transaction. The result of the query is a FHIR Bundle containing DocumentReference Resources that match the query parameters.

### 2:3.67.2 Actors Roles

**Table 2:3.67.2-1: Actor Roles**

|Actor | Role |
|-------------------+--------------------------|
| [Document Consumer](1331_actors_and_transactions.html#133112-document-consumer)     | Requests a list of DocumentReference Resources, matching the supplied set of criteria, from the Document Responder |
| [Document Responder](1331_actors_and_transactions.html#133114-document-responder) | Returns DocumentReference Resources that match the search criteria provided by the Document Consumer |
{: .grid}

### 2:3.67.3 Referenced Standards

**FHIR-R4** [HL7 FHIR Release 4.0](http://www.hl7.org/FHIR/R4)

### 2:3.67.4 Messages

<div>
{%include ITI-67-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:3.67.4-1: Find Document References Interactions**

#### 2:3.67.4.1 Find Document References Request message

This message uses the search method parameterized query to obtain DocumentReference Resources from the Document Responder. 

##### 2:3.67.4.1.1 Trigger Events

When the Document Consumer needs to discover DocumentReference Resources matching various metadata parameters, it issues a Find Document References message. 

##### 2:3.67.4.1.2 Message Semantics

The Document Consumer executes an HTTP search against the Document Responders DocumentReference URL. The search target follows the FHIR HTTP specification, addressing the DocumentReference Resource [http://hl7.org/fhir/R4/http.html](http://hl7.org/fhir/R4/http.html):
```
[base]/DocumentReference?<query>
```
This URL is configurable by the Document Responder and is subject to the following constraints: 

The `<query>` represents a series of encoded name-value pairs representing the filter for the query, as specified in Section [Query Search Parameters](#23674121-query-search-parameters), as well as control parameters to modify the behavior of the Document Responder such as response format, or pagination.

The Document Consumer may use GET or POST based searches. The Document Responder shall support both GET and POST based searches [http://hl7.org/fhir/R4/http.html#search](http://hl7.org/fhir/R4/http.html#search).


###### 2:3.67.4.1.2.1 Query Search Parameters

The Document Consumer may supply, and the Document Responder shall be capable of processing, all query parameters listed below. All query parameter values shall be appropriately encoded per RFC3986 “percent” encoding rules. Note that percent encoding does restrict the character set to a subset of ASCII characters which is used for encoding all other characters used in the URL.

The Document Consumer shall include search parameter `patient` or `patient.identifier`, and `status`. The other parameters described below are optional. The Document Responder must implement the parameters described below. The Document Responder may choose to support additional query parameters beyond the subset listed below. Any additional query parameters supported shall be supported according to the core FHIR specification. Such additional parameters are considered out of scope for this transaction. Any additional parameters not supported should be ignored. See [http://hl7.org/fhir/R4/search.html#errors](http://hl7.org/fhir/R4/search.html#errors). 

**author.given** and **author.family**:
These parameters, of type string, specify the name parts of the author person, which is associated with the DocumentReference Resource, or in Document Sharing nomenclature, the author of the Document Entry. See [ITI TF-2x: Appendix Z.2](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.2-query-parameters) for use of the string data type.  This use of **author.given** and **author.family** follows the [FHIR Chaining Parameters](http://hl7.org/fhir/search.html#chaining) search methodology.

**category**:
This parameter, of type token, specifies the general classification of the DocumentReference Resource, or in Document Sharing nomenclature, the classCode of the Document Entry. See [ITI TF-2x: Appendix Z.2](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.2-query-parameters) for additional constraints on the use of the token search parameter type.

**creation**:
This IHE defined parameter defined as [DocumentReference-Creation](SearchParameter-DocumentReference-Creation.html), of type dateTime, specifies a search against the DocumentReference.content.attachment.creation. See FHIR [http://hl7.org/fhir/R4/search.html#date](http://hl7.org/fhir/R4/search.html#date) for use of the date search type.

**date**:
This parameter, of type date, specifies the time when the DocumentReference was created. See FHIR [http://hl7.org/fhir/R4/search.html#date](http://hl7.org/fhir/R4/search.html#date) for use of the date search type.

**event**:
This parameter, of type token, specifies the main clinical acts documented by the DocumentReference Resource, or in Document Sharing nomenclature, the eventCodeList of the Document Entry. See [ITI TF-2x: Appendix Z.2](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.2-query-parameters) for additional constraints on the use of the token search parameter type.

**facility**:
This parameter, of type token, specifies the kind of facility found in DocumentReference.context.facilityType, or in Document Sharing nomenclature, the healthcareFacilityTypeCode of the Document Entry. See [ITI TF-2x: Appendix Z.2](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.2-query-parameters) for additional constraints on the use of the token search parameter type.

**format**:
This parameter, of type token, specifies the format of the DocumentReference Resource, or in Document Sharing nomenclature, the formatCode of the Document Entry. See [ITI TF-2x: Appendix Z.2](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.2-query-parameters) for additional constraints on the use of the token search parameter type.

**identifier**:
This parameter, of type token, specifies an identifier for this DocumentReference and/or the contained document. The search results represent the results of a search on DocumentReference.masterIdentifier and DocumentReference.identifier. See [ITI TF-2x: Appendix Z.2](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.2-query-parameters) for additional constraints on the use of the token search parameter type. 

**patient**:
This parameter is of type Reference(Patient). The Document Consumer may get this reference using the [PDQm](https://profiles.ihe.net/ITI/TF/Volume1/ch-38.html) or [PIXm](https://profiles.ihe.net/ITI/TF/Volume1/ch-41.html) Profile. When the patient parameter is used, the Patient reference would need to be accessible to both the Document Consumer and the Document Responder.

**patient.identifier**:
This parameter, of type token, specifies an identifier associated with the patient to which the DocumentReference Resource is assigned.  See [ITI TF-2x: Appendix Z.2](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.2-query-parameters) for additional constraints on the use of the token search parameter type. This use of **patient.identifier** follows the [FHIR Chaining Parameters](http://hl7.org/fhir/search.html#chaining) search methodology.

**period**:
This parameter, of type date, represents the time of service that is being documented by the DocumentReference. The period search parameter specifies an interval which the time of service overlaps. In Document Sharing nomenclature, this query parameter represents from/to parameters for the serviceStartTime and serviceStopTime of the Document Entry. See FHIR [http://hl7.org/fhir/R4/search.html#date](http://hl7.org/fhir/R4/search.html#date) for use of the date search type.

**related**:
This parameter, of type reference, represents other identifiers associated with the DocumentReference Resource, or in Document Sharing nomenclature, the referenceIdList of the Document Entry. 

**security-label**:
This parameter, of type token, specifies the security labels of the document referenced by DocumentReference Resource, or in Document Sharing nomenclature, the confidentialityCode of the Document Entry. See [ITI TF-2x: Appendix Z.2](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.2-query-parameters) for additional constraints on the use of the token search parameter type.

**setting**:
This parameter, of type token, specifies the specific practice setting of the DocumentReference Resource, or in Document Sharing nomenclature, the practiceSettingCode of the Document Entry. See [ITI TF-2x: Appendix Z.2](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.2-query-parameters) for additional constraints on the use of the token search parameter type.

**status**:
This parameter, of type token, specifies the status of the DocumentReference Resource, or in Document Sharing nomenclature, the availabilityStatus of the Document Entry. The Document Consumer shall populate the identifier portion of the token using one of the short codes in Table 2:3.67.4.1.2.1-1. The system portion of the token shall not be populated.

**type**:
This parameter, of type token, specifies the specific type of the DocumentReference resource or in Document Sharing nomenclature, the typeCode of the Document Entry. See [ITI TF-2x: Appendix Z.2](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.2-query-parameters) for additional constraints on the use of the token search parameter type.

###### 2:3.67.4.1.2.2 Populating Expected Response Format

The FHIR standard provides encodings for responses as either XML or JSON. The Document Responder shall support both message encodings, whilst the Document Consumer shall support one and may support both.

See [ITI TF-2x: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) for details. 

###### 2:3.67.4.1.2.3 Example DocumentReference search

For example given:
* FHIR server root is `http://test.fhir.org/R4/fhir`
* Patient reference id is `9876`
* status of current
* with clinical code from loinc of `1234-5`
* examples do not include all http headers such as the security headers

###### 2:3.67.4.1.2.3.1 Example GET
```
GET test.fhir.net/R4/fhir/DocumentReference?patient=9876&status=current&type=http://loinc.org|1234-5
```

###### 2:3.67.4.1.2.3.2 Example POST
```
POST test.fhir.net/R4/fhir/DocumentReference/_search?patient=9876&status=current&type=http://loinc.org|1234-5
```

###### 2:3.67.4.1.2.3.3 Example POST body
```
POST test.fhir.net/R4/fhir/DocumentReference/_search	  
Host test.fhir.net
Content-Type: application/x-www-form-urlencoded
Accept: application/fhir+json; fhirVersion=4.0										  

patient=9876&status=current&type=http://loinc.org|1234-5
```

##### 2:3.67.4.1.3 Expected Actions

The Document Responder shall process the query to discover the DocumentReference entries that match the search parameters given. 

###### 2:3.67.4.1.3.1 XDS on FHIR Option

The Document Responder is grouped with an XDS Document Consumer when it supports the [XDS on FHIR](1332_actor_options.html#13322-xds-on-fhir-option) Option. The Document Responder shall map the query parameters as listed in Table 2:3.67.4.1.3.1-1 and shall execute a Registry Stored Query [ITI-18] for FindDocuments or FindDocumentsByReferenceIdList (see [ITI TF-2a: 3.18.4.1.2.3.7.1](https://profiles.ihe.net/ITI/TF/Volume2/ITI-18.html#3.18.4.1.2.3.7.1) and [3.18.4.1.2.3.7.14](https://profiles.ihe.net/ITI/TF/Volume2/ITI-18.html#3.18.4.1.2.3.7.14) ). All of the query parameters in Table 3.67.4.1.3-1 shall be supported by the Document Responder. No additional query parameters as defined in FHIR are required of the Document Responder, but they may be offered.

**Table 2:3.67.4.1.3.1-1: ITI-18 FindDocuments Query Parameter Mapping**

| ITI-67 Parameter Name	| ITI-18 Parameter Name |
|-----------|-----------|
| patient or patient.identifier	| $XDSDocumentEntryPatientId |
| creation (Note 1) (Note 5)	| $XDSDocumentEntryCreationTimeFrom |
| creation (Note 2) (Note 5)	| $XDSDocumentEntryCreationTimeTo |
| author.given / author.family	| $XDSDocumentEntryAuthorPerson |
| status	| $XDSDocumentEntryStatus |
| (Not supported) (Note 3)	| $XDSDocumentEntryType |
| category	| $XDSDocumentEntryClassCode |
| type	| $XDSDocumentEntryTypeCode |
| setting	| $XDSDocumentEntryPracticeSettingCode |
| period (Note 1)	| $XDSDocumentEntryServiceStartTimeFrom |
| period (Note 2)	| $XDSDocumentEntryServiceStartTimeTo |
| period (Note 1)	| $XDSDocumentEntryServiceStopTimeFrom |
| period (Note 2)	| $XDSDocumentEntryServiceStopTimeTo |
| facility	| $XDSDocumentEntryHealthcareFacilityTypeCode |
| event	| $XDSDocumentEntryEventCodeList |
| security-label	| $XDSDocumentEntryConfidentialityCode |
| format	| $XDSDocumentEntryFormatCode |
| related (Note 4)	| $XDSDocumentEntryReferenceIdList |
{: .grid}

Note 1: This FindDocuments parameter is used when the greater than parameter modifier is used on the given parameter. 

Note 2: This FindDocuments parameter is used when the less than parameter modifier is used on the given parameter. 

Note 3: The $XDSDocumentEntryType is not a supported query parameter in HL7 FHIR.

Note 4: The $XDSDocumentEntryReferenceIdList can only be mapped when using the XDS FindDocumentsByReferenceId query. This parameter support requires XDS [Reference ID Option](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.2.6).

Note 5: The FHIR DocumentReference does not yet have a query parameter for creationTime of the document, it has only a date element which is the creation date/time of the DocumentReference. For FHIR R4 we align these two elements so that query will function.

**Table 2:3.67.4.1.3.1-2: Values for code for status of DocumentReference**

|FHIR Code	|ebRIM Code |
|-----------|-----------|
|current	|urn:oasis:names:tc:ebxml-regrep:StatusType:Approved |
|superseded	|urn:oasis:names:tc:ebxml-regrep:StatusType:Deprecated |
{: .grid}

#### 2:3.67.4.2 Find Document References Response message

The Document Responder returns a HTTP Status code appropriate to the processing as well as a Bundle of the matching DocumentReference Resources.

##### 2:3.67.4.2.1 Trigger Events

The Document Responder completed processing of the Find Document Reference Request message. 

##### 2:3.67.4.2.2 Message Semantics

Based on the query results, the Document Responder will either return an error or success. Guidance on handling Access Denied related to use of 200, 403 and 404 can be found in [ITI TF-2x: Appendix Z.7](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations). 

When the Document Responder needs to report an error, it shall use HTTP error response codes and should include a FHIR OperationOutcome with more details on the failure. See FHIR [http://hl7.org/fhir/R4/http.html](http://hl7.org/fhir/R4/http.html) and [http://hl7.org/fhir/R4/operationoutcome.html](http://hl7.org/fhir/R4/operationoutcome.html).

If the Find Document References message is processed successfully, whether or not any DocumentReference Resources are found, the HTTP status code shall be 200. The Find Document References Response message shall be a Bundle Resource containing zero or more DocumentReference Resources. If the Document Responder is sending warnings, the Bundle Resource shall also contain an OperationOutcome Resource that contains those warnings.

The response shall adhere to the FHIR Bundle constraints specified in [ITI TF-2x: Appendix Z.1](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.1-resource-bundles). The response bundle for a MHD Find Document References Comprehensive Response [is defined here](StructureDefinition-IHE.MHD.FindDocumentReferencesComprehensiveResponseMessage.html), with an [example](StructureDefinition-IHE.MHD.FindDocumentReferencesComprehensiveResponseMessage-examples.html).

###### 2:3.67.4.2.2.1 DocumentReference Resource Contents

The DocumentReference Resources returned shall be compliant with the FHIR specification [http://hl7.org/fhir/R4/documentreference.html](http://hl7.org/fhir/R4/documentreference.html).

The DocumentReference Resources returned will be compliant with the [MHD metadata](32_fhir_maps.html) for the IHE restrictions on DocumentReference Resource and with the [mapping to DocumentEntry](32_fhir_maps.html#documentEntry) from IHE Document Sharing profiles (e.g., XDS) to FHIR. 

###### 2:3.67.4.2.2.1.1 Document location

The Document Responder shall place into the DocumentReference.content.attachment.url element a full URL that can be used by the Document Consumer to retrieve the document using the Retrieve Document [ITI-68](ITI-68.html) transaction. IHE does not specify the format of the URL. There are many ways to encode this URL that allow for easy processing on a [Retrieve Document](ITI-68.html) transaction. Some examples are to encode homeCommunityId, repositoryUniqueId, uniqueId, and patientId into the URL. This could be done in many ways including using character separators or directory separators. In this way, the Document Responder can support many communities, and/or many repositories. 

###### 2:3.67.4.2.2.1.2 Support for On-Demand Documents

[XDS](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html) introduced the concept of a [On-Demand Document Option](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.2.7), and is explained in the [Use Cases Summary](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.4.11.3). The use of On-Demand Documents allows for documents that would be produced for a specific patient with content assembled at the time of processing the document consumer retrieve request.

On-Demand Documents are indicated in the DocumentReference by the DocumentReference.content.attachment with an absent .hash and .size element. For more background on [On-Demand Documents](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.2.7). There is no need to declare an On-Demand Documents Option in MHD. 

Informative note: When the Document Consumer retrieves the document using the Document location, then the retrieved document might exist as an [IsSnapshotOf Association according to XDS ITI-43](https://profiles.ihe.net/ITI/TF/Volume2/ITI-43.html#3.43.4.2.3). The IsSnapshotOf Association is identified as a new DocumentReference with relatesTo.code of `transforms`.

###### 2:3.67.4.2.2.1.3 Support for Delayed Document Assembly

[XDS](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html) introduced the concept of [Delayed Document Assembly Option](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.2.10), and is explained in the [Use Cases Summary](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.4.11.3). The use of Delayed Document Assembly allows source systems to register the existence of stable document content but defer actually assembling the document content only if and when it is retrieved. 

Delayed Document Assembly is distinct from On-Demand Documents in that Delayed Document Assembly is a Documents that are static, clinician attested documents and the content of the document is identified prior to registration of the Document Entry. On-Demand Documents allows the content of the document to be identified at the time of receipt of the retrieval request (e.g., summary, or current). Delayed Document Assembly has been designed to be as transparent as possible to Document Consumer Actors. Document Consumers Actors may easily support Stable Documents whose assembly has been delayed just as if they were a regular Stable Document since the only constraint on Document Consumers brought by this Delayed Document Assembly Option is to support responses to queries with the presence of Stable Document Entries that have zero size and hash values.

Delayed Document Assembly are indicated in the DocumentReference by the DocumentReference.content.attachment with an .size element of `0` (zero), and a .hash element with the fixed value `da39a3ee5e6b4b0d3255bfef95601890afd80709` (SHA1 hash of a zero length file). For more background on the [Delayed Document Assembly](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.2.10). There is no need to declare a Delayed Document Assembly in MHD. 

Informative note: When the Document Consumer retrieves the document using the Document location, then the retrieved document actual size and hash is updated in the DocumentReference. In this way the Document Consumer may retrieve the updated DocumentReference after successful retrival of the document to find the size and hash for content integrity validation.

###### 2:3.67.4.2.2.1.4 XDS Associations

Where the documentReference Resource being returned has an XDS Association, this shall be represented in the DocumentReference.relatesTo element. Where the DocumentReference.relatesTo.target element holds the Reference to the other DocumentReference Resource, and the DocumentReference.relatesTo.code element holds the relationship type translated using the [AssociationType vs RelatesTo ConceptMap](ConceptMap-AssociationTypeVsRelatesTo.html).

###### 2:3.67.4.2.2.2 Resource Bundling

Resource Bundling shall comply with the guidelines in [ITI TF-2x: Appendix Z.1](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.1-resource-bundles). 

#### 2:3.67.4.3 Expected Actions

If the Document Responder returns an HTTP redirect response (HTTP status codes 301, 302, 303, or 307), the Document Consumer shall follow the redirect, but may stop processing if it detects a loop. See RFC7231 Section 6.4 Redirection 3xx.

The Document Consumer shall process the results according to application-defined rules. The Document Consumer should be robust as the response may contain DocumentReference Resources that match the query parameters but are not compliant with the DocumentReference constraints defined here.

#### 2:3.67.4.4 CapabilityStatement Resource

Document Responders implementing this transaction shall provide a CapabilityStatement Resource as described in [ITI TF-2x: Appendix Z.3](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.3-capabilitystatement-resource) indicating the transaction has been implemented. 
* Requirements CapabilityStatement for [Document Consumer](CapabilityStatement-IHE.MHD.DocumentConsumer.html)
* Requirements CapabilityStatement for [Document Responder](CapabilityStatement-IHE.MHD.DocumentResponder.html)

### 2:3.67.5 Security Considerations

See [MHD Security Considerations](1335_security_considerations.html).

This transaction should not return information that the Document Consumer is not authorized to access. Where authorization here is inclusive of system, app, and user according to local policy, patient consents, and security layering. However, the transaction may return DocumentReference resources that have Reference elements that the Document Consumer may not have access to. This is to say that the authorization need only be to the content returned in the Bundle. There may be references (URLs) for which the content is not authorized. This is considered proper as the Document Consumer would need to retrieve the content pointed to by those references, and at that time the proper authorization decision would be made on that context and content. In this way it is possible for a Document Consumer to get DocumentManifest resources that are pointing at data that the Document Consumer is not authorized to retrieve. Thus, the URLs used must be carefully crafted so as to not expose sensitive data in the URL value.

Given that the Document Responder is responsible for the URL placed into DocumentReference.content.attachment.url, care must be taken to assure that manipulation of this URL prior to a Retrieve Document transaction does not expose resources the Document Consumer should not have access to.

#### 2:3.67.5.1 Security Audit Considerations

The security audit criteria are similar to those for the Registry Stored Query [ITI-18](https://profiles.ihe.net/ITI/TF/Volume2/ITI-18.html#3.18.5) transaction. 

##### 2:3.67.5.1.1 Document Consumer Audit

The Document Consumer when grouped with ATNA Secure Node or Secure Application actor shall be able to record a [Find Document References Consumer Audit Event Log](StructureDefinition-IHE.MHD.FindDocumentReferences.Audit.Consumer.html). [Audit Example for a Find Document References transaction from consumer perspective](AuditEvent-ex-auditFindDocumentReferences-consumer.html). 

##### 2:3.67.5.1.2 Document Responder Audit

The Document Responder when grouped with ATNA Secure Node or Secure Application actor shall be able to record a [Find Document References Responder Audit Event Log](StructureDefinition-IHE.MHD.FindDocumentReferences.Audit.Responder.html). [Audit Example for a Find Document Lists Transaction from responder perspective](AuditEvent-ex-auditFindDocumentReferences-responder.html). 
