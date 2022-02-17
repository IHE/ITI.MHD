This section corresponds to transaction [ITI-66] of the IHE Technical Framework. Transaction [ITI-66] is used by the Document Consumer and Document Responder Actors. This transaction is used to locate and return metadata for previously stored document submission sets or folders.

### 2:3.66.1 Scope

The Find Document Lists [ITI-66] transaction is used to find List Resources that satisfy a set of parameters. It is equivalent to the: 

* FindSubmissionSets query in the Registry Stored Query [ITI-18](https://profiles.ihe.net/ITI/TF/Volume2/ITI-18.html) transaction, as documented in [ITI TF-2: 3.18.4.1.2.3.7.2](https://profiles.ihe.net/ITI/TF/Volume2/ITI-18.html#3.18.4.1.2.3.7.2). 
* FindFolders query in the Registry Stored Query [ITI-18](https://profiles.ihe.net/ITI/TF/Volume2/ITI-18.html) transaction, as documented in [ITI TF-2: 3.18.4.1.2.3.7.3](https://profiles.ihe.net/ITI/TF/Volume2/ITI-18.html#3.18.4.1.2.3.7.3). 

The result of the query is a Bundle containing List Resources that match the query parameters.

### 2:3.66.2 Actors Roles

**Table 3.66.2-1: Actor Roles**

|Actor | Role |
|-------------------+--------------------------|
| [Document Consumer](1331_actors_and_transactions.html#133112-document-consumer)     | Requests List Resources, matching the supplied set of criteria, from the Document Responder |
| [Document Responder](1331_actors_and_transactions.html#133114-document-responder) | Returns List Resources that match the search criteria provided by the Document Consumer |
{: .grid}

### 2:3.66.3 Referenced Standards

**FHIR-R4** [HL7 FHIR Release 4.0](http://www.hl7.org/FHIR/R4)

### 2:3.66.4 Messages

<div>
{%include ITI-66-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:3.66.4-1: Find Document Lists Interactions**

#### 2:3.66.4.1 Find Document Lists Request message

This message uses the search method parameterized query to obtain List Resources from the Document Responder. 

##### 2:3.66.4.1.1 Trigger Events

When the Document Consumer needs to discover List Resources matching various metadata parameters it issues a Find Document Lists message. 

##### 2:3.66.4.1.2 Message Semantics

The Document Consumer executes an HTTP search against the Document Responder List endpoint. The search target follows the FHIR HTTP specification, addressing the List Resource [http://hl7.org/fhir/R4/http.html](http://hl7.org/fhir/R4/http.html):
```
[base]/List?<query>
```
This URL is configurable by the Document Responder and is subject to the following constraints: 

The `<query>` represents a series of encoded name-value pairs representing the filter for the query as well as control parameters to modify the behavior of the Document Responder such as response format, or pagination.

The Document Consumer may use GET or POST based searches. The Document Responder shall support both GET and POST based searches [http://hl7.org/fhir/R4/http.html#search](http://hl7.org/fhir/R4/http.html#search).

###### 2:3.66.4.1.2.1 Query Search Parameters

The Document Consumer may supply, and the Document Responder shall be capable of processing all query parameters listed below. All query parameter values shall be appropriately encoded per RFC3986 “percent” encoding rules. Note that percent encoding does restrict the character set to a subset of ASCII characters which is used for encoding all other characters used in the URL.

The Document Consumer shall include search parameter `patient` or `patient.identifier`, `code`, and `status`. The other parameters described below are optional. The Document Responder shall implement the parameters described below. The Document Responder may choose to support additional query parameters beyond the subset listed below. Any additional query parameters supported shall be supported according to the core FHIR specification. Such additional parameters are considered out of scope for this transaction. Any additional parameters not supported should be ignored. See [http://hl7.org/fhir/R4/search.html#errors](http://hl7.org/fhir/R4/search.html#errors).

**code**: 
This parameter, of type token, specifies the code.coding value supplied in the List Resource. The value of the code element indicates the List of type SubmissionSet or Folder as indicated

**date**:
This parameter, of type date, specifies the time when the List was created. See FHIR [http://hl7.org/fhir/R4/search.html#date](http://hl7.org/fhir/R4/search.html#date) for use of the date search type.

**designationType**:
This IHE extension on parameters defined as [List-DesignationType](SearchParameter-List-DesignationType.html), of type token, specifies the designation type of the List. The value of the designation type element expresses contentType of submissionSet or the codeList of a Folder. Usually expressed in LOINC or SNOMED. Note that servers that do not support this extended search parameter will ignore it, and thus return more results than expected.

**identifier**:
This parameter, of type token, specifies an identifier for this List. The search results represent the results of a search on List.identifier. See [ITI TF-2x: Appendix Z.2](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.2-query-parameters) for additional constraints on the use of the token search parameter type. 

**patient**:
This parameter is of type Reference(Patient). The Document Consumer may get this reference through the use of the [PDQm](https://profiles.ihe.net/ITI/TF/Volume1/ch-38.html) or [PIXm](https://profiles.ihe.net/ITI/TF/Volume1/ch-41.html) Profiles, or by some other method. When the patient parameter is used, the Patient reference would need to be accessible to both the Document Consumer and the Document Responder.

**patient.identifier**:
This parameter, of type token, specifies an identifier associated with the patient to which the List Resource is assigned. See [ITI TF-2x: Appendix Z.2](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.2-query-parameters) for use of the token data type for identifiers. This use of **patient.identifier** follows the [FHIR Chaining Parameters](http://hl7.org/fhir/search.html#chaining) search methodology.

**source.given and source.family**:
These parameters, of type string, specify the name parts of the author person which is associated with the List. See [ITI TF-2x: Appendix Z.2](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.2-query-parameters) for use of the string data type. This use of **source.given** and **source.family** follows the [FHIR Chaining Parameters](http://hl7.org/fhir/search.html#chaining) search methodology.

**sourceId**:
This IHE extension on parameters defined as [List-SourceId](SearchParameter-List-SourceId.html), of type token, specifies the source (author) value supplied in the List Resource. 

**status**:
This parameter, of type token, specifies the status of the List. If included in the query, the Document Consumer shall populate the code portion of the token with one of the codes in the following *Table 2:3.66.4.1.2.1-1: Values for code for status of List*. The system portion of the token shall not be populated.

**Table 2:3.66.4.1.2.1-1: Values for code for status of List**

|Code	| ebRIM Code |
|current	| urn:oasis:names:tc:ebxml-regrep:StatusType:Approved |
|superseded	| urn:oasis:names:tc:ebxml-regrep:StatusType:Deprecated |
{: .grid}

###### 2:3.66.4.1.2.2 Populating Expected Response Format

The FHIR standard provides encodings for responses as either XML or JSON. The Document Responder shall support both message encodings, whilst the Document Consumer shall support one and may support both.

See [ITI TF-2x: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) for details. 

###### 2:3.66.4.1.2.3 Example List search

For example given:
* FHIR server root is `http://test.fhir.org/R4/fhir`
* Patient reference id is `9876`
* looking for a SubmissionSet
* status of current
* with clinical code from loinc of `1234-5`
* examples do not include all http headers such as the security headers						   

###### 2:3.66.4.1.2.3.1 Example GET
```
GET test.fhir.net/R4/fhir/List?patient=9876&code=submissionset&status=current&designationType=http://loinc.org|1234-5
```

###### 2:3.66.4.1.2.3.2 Example POST
```
POST test.fhir.net/R4/fhir/List/_search?patient=9876&code=submissionset&status=current&designationType=http://loinc.org|1234-5
```

###### 2:3.66.4.1.2.3.3 Example POST body
```
POST test.fhir.net/R4/fhir/List/_search
Content-Type: application/x-www-form-urlencoded

patient=9876&code=submissionset&status=current&designationType=http://loinc.org|1234-5
```

##### 2:3.66.4.1.3 Expected Actions

The Document Responder shall process the query to discover the List entries that match the search parameters given.

###### 2:3.66.4.1.3.1 XDS on FHIR Option

The Document Responder is grouped with an XDS Document Consumer when it supports the [XDS on FHIR](1332_actor_options.html#13322-xds-on-fhir-option) Option. The Document Responder shall map the query parameters as listed in Table 2:3.66.4.1.3.1-1 and shall execute a Registry Stored Query [ITI-18] for FindSubmissionSets or FindFolders. No additional query parameters as defined in FHIR are required of the Document Responder.

**Table 2:3.66.4.1.3.1-1: FindSubmissionSets Query Parameter Mapping**

|ITI-66 Parameter Name	| ITI-18 Parameter Name |
|code | "submissionset" |
|patient or patient.identifier	| $XDSSubmissionSetPatientId |
|date (Note 1)	| $XDSSubmissionSetSubmissionTimeFrom |
|date (Note 2)	| $XDSSubmissionSetSubmissionTimeTo |
|source.given / source.family	| $XDSSubmissionSetAuthorPerson |
|designationType | $XDSSubmissionSetContentType |
|sourceId	| $XDSSubmissionSetSourceId |
|status	| $XDSSubmissionSetStatus |
{: .grid}

Note 1: This FindSubmissionSets parameter is used when the greater than parameter modifier is used on the created parameter.

Note 2: This FindSubmissionSets parameter is used when the less than parameter modifier is used on the created parameter. 

**Table 2:3.66.4.1.3.1-2: FindFolders Query Parameter Mapping**

|ITI-66 Parameter Name	| ITI-18 Parameter Name |
|code | "folder" |
|patient or patient.identifier	| $XDSFolderPatientId |
|date (Note 1)	| $XDSFolderLastUpdateTimeFrom |
|date (Note 2)	| $XDSFolderLastUpdateTimeTo |
|designationType | $XDSFolderCodeList |
|status	| $XDSFolderStatus |
{: .grid}

Note 1: This FindFolder parameter is used when the greater than parameter modifier is used on the created parameter.

Note 2: This FindFolder parameter is used when the less than parameter modifier is used on the created parameter. 

Note 3: Parameters specific to "submissionset" shall be silently ignored.

**Translation of Token Parameter**

Query parameters of type token are used to represent codes and identifiers. See [https://www.hl7.org/fhir/R4/search.html#token](https://www.hl7.org/fhir/R4/search.html#token). 

The manner in which the Document Responder translates these parameters to ebXML to support the Registry Stored Query [ITI-18] transaction will depend on the type of the corresponding parameter within the FindSubmissionSets stored query (see [ITI TF-2: 3.18.4.1.2.3.7.2](https://profiles.ihe.net/ITI/TF/Volume2/ITI-18.html#3.18.4.1.2.3.7.2) ). 
* If the token parameter translates to a codified stored query parameter, then the Document Responder shall represent the token parameter in the stored query as: `<Value>('code^^system')</Value>`
* If the token parameter translates to a patient identifier in the FindSubmissionSets stored query, then the Document Responder shall represent the token parameter in the stored query as: `<Value>code^^^&amp;system&amp;ISO</Value>` 
* If the token parameter translates to a simple string, then the code shall be used for the parameter and the system shall be ignored.

**Translation of Name Components**

Query parameters representing a name, for example `source.given` and `source.family` shall be translated to an appropriate XCN instance in the ebXML query. For example: 
```
…&source.given=Marcus&source.family=Welby
```
would translate to:
```
<Value>^Welby^Marcus^^^</Value>
```
#### 2:3.66.4.2 Find Document Lists Response message

The Document Responder returns a HTTP Status code appropriate to the processing as well as a list of the matching document list resources.

##### 2:3.66.4.2.1 Trigger Events

The Document Responder completed processing of the Find Document Lists message. 

##### 2:3.66.4.2.2 Message Semantics

Based on the query results, the Document Responder will either return an error or success. Guidance on handling Access Denied related to use of 200, 403 and 404 can be found in [ITI TF-2x: Appendix Z.7](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations).

When the Document Responder needs to report an error, it shall use HTTP error response codes and should include a FHIR OperationOutcome with more details on the failure. See FHIR [http://hl7.org/fhir/R4/http.html](http://hl7.org/fhir/R4/http.html) and [http://hl7.org/fhir/R4/operationoutcome.html](http://hl7.org/fhir/R4/operationoutcome.html).

If the Find Document Lists message is processed successfully, whether or not any List Resources are found, the HTTP status code shall be 200. The Find Document Lists Response message shall be a Bundle Resource containing zero or more List Resources. If the Document Responder is sending warnings, the Bundle Resource shall also contain an OperationOutcome Resource that contains those warnings.

The response shall adhere to the FHIR Bundle constraints specified in [ITI TF-2x: Appendix Z.1](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.1-resource-bundles). 

An informative StructureDefinition is outlined for [MHD Find Document Lists Response message](StructureDefinition-IHE.MHD.FindDocumentListsResponseMessage.html), with an [example](Bundle-ex-findDocumentListsResponse.html).

**List Resource Contents**

The List Resources returned shall be compliant with the FHIR specification [http://hl7.org/fhir/R4/list.html](http://hl7.org/fhir/R4/list.html).

The List Resources returned will be compliant with the [IHE restrictions on the List Resource](32_fhir_maps.html) and with the mapping of ebXML attributes to List elements to [SubmissionSet](32_fhir_maps.html#submissionSet) and to [Folder](32_fhir_maps.html#folder).

##### 2:3.66.4.2.3 Expected Actions

If the Document Responder returns an HTTP redirect response (HTTP status codes 301, 302, 303, or 307), the Document Consumer shall follow the redirect, but may stop processing if it detects a loop. See RFC7231 Section 6.4 Redirection 3xx.

The Document Consumer shall process the results according to application-defined rules. The Document Consumer should be robust as the response may contain List Resources that match the query parameters but are not compliant with the List constraints defined in [ITI TF-3: 4.5](32_fhir_maps.html).

#### 2:3.66.4.3 CapabilityStatement Resource

Document Responders implementing this transaction shall provide a CapabilityStatement Resource as described in [ITI TF-2x: Appendix Z.3](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.3-capabilitystatement-resource) indicating the transaction has been implemented. 
* Requirements CapabilityStatement for [Document Consumer](CapabilityStatement-IHE.MHD.DocumentConsumer.html)
* Requirements CapabilityStatement for [Document Responder](CapabilityStatement-IHE.MHD.DocumentResponder.html)


### 2:3.66.5 Security Considerations

See [MHD Security Considerations](1335_security_considerations.html).

This transaction should not return information that the Document Consumer is not authorized to access. Where authorization here is inclusive of system, app, and user according to local policy, patient consents, and security layering. However, the transaction may return List resources that have Reference elements that the Document Consumer may not have access to. This is to say that the authorization need only be to the content returned in the Bundle. There may be references (URLs) for which the content is not authorized. This is considered proper as the Document Consumer would need to retrieve the content pointed to by those references, and at that time the proper authorization decision would be made on that context and content. In this way it is possible for a Document Consumer to get List Resources that are pointing at data that the Document Consumer is not authorized to retrieve. Thus, the URLs used must be carefully crafted so as to not expose sensitive data in the URL value.

#### 2:3.66.5.1 Security Audit Considerations

The security audit criteria are similar to those for the Registry Stored Query [ITI-18](https://profiles.ihe.net/ITI/TF/Volume2/ITI-18.html) transaction.

##### 2:3.66.5.1.1 Document Consumer Audit

The Document Consumer when grouped with ATNA Secure Node or Secure Application actor shall be able to record a [Find Document Lists Consumer Audit Event Log](StructureDefinition-IHE.MHD.FindDocumentLists.Audit.Consumer.html). [Audit Example for a Find Document Lists transaction from consumer perspective](AuditEvent-ex-auditFindDocumentLists-consumer.html).

##### 2:3.66.5.1.2 Document Responder Audit

The Document Responder when grouped with ATNA Secure Node or Secure Application actor shall be able to record a [Find Document Lists Responder Audit Event Log](StructureDefinition-IHE.MHD.FindDocumentLists.Audit.Responder.html). [Audit Example for a Find Document Lists Transaction from responder perspective](AuditEvent-ex-auditFindDocumentLists-responder.html).
