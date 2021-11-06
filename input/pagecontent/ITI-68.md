This section corresponds to transaction [ITI-68] of the IHE Technical Framework. Transaction [ITI-68] is used by the Document Consumer and Document Responder Actors.

### 2:3.68.1 Scope

The Retrieve Document [ITI-68] transaction is used by the Document Consumer to retrieve a document from the Document Responder.

### 2:3.68.2 Actors Roles

**Table 2:3.68.2-1: Actor Roles**

|Actor | Role |
|-------------------+--------------------------|
| [Document Consumer](1331_actors_and_transactions.html#133112-document-consumer)    | Requests a document from the Document Responder |
| [Document Responder](1331_actors_and_transactions.html#133114-document-responder) | Serves the document to the Document Consumer |
{: .grid}

### 2:3.68.3 Referenced Standards

**FHIR-R4** [HL7 FHIR Release 4.0](http://www.hl7.org/FHIR/R4)

### 2:3.68.4 Messages

<div>
{%include ITI-68-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:3.68.4-1: Retrieve Document Interactions**

#### 2:3.68.4.1 Retrieve Document Request Message

This message is an HTTP GET request to retrieve the document. 

##### 2:3.68.4.1.1 Trigger Events

The Document Consumer wants to obtain a document. 

##### 2:3.68.4.1.2 Message Semantics

The Document Consumer sends a HTTP GET request to the server. The Document Consumer request may be to retrieve the document content referenced by a DocumentReference.content.attachment.url. 

The Document Consumer may provide HTTP Accept header, according to the semantics of the HTTP protocols (see RFC2616, Section 14.1).  This enables the Document Consumer to indicate prefered mime-types such that the Document Responder could provide the document requested in an encoding other than the encoding indicated in the DocumentReference. For example, indicating `application/fhir+json` could result in the response from the Document Responder being a json FHIR Bundle of type `document` with all the content encoded as FHIR resources.

The only MIME type assured to be returned is the MIME type indicated in the DocumentReference.content.attachment.contentType.

The HTTP If-Unmodified-Since header shall not be included in the GET request.

##### 2:3.68.4.1.3 Expected Actions

The Document Responder shall provide the document in the requested MIME type or reply with an HTTP status code indicating the error condition. The Document Responder is not required to transform the document.

#### 2:3.68.4.2 Retrieve Document Response Message

This is the return message sent by the Document Responder. 

##### 2:3.68.4.2.1 Trigger Events

The HTTP Response message is sent upon completion of the Retrieve Document Request. 

##### 2:3.68.4.2.2 Message Semantics

This message shall be an HTTP Response, as specified by RFC2616. When the requested document is returned, the Document Responder shall respond with HTTP Status Code 200. The HTTP message-body shall be the content of the requested document.

Table 2:3.68.4.2.2-1 contains error situations and the HTTP Response.

**Table 2:3.68.4.2.2-1: HTTP Error Response Codes and Suggested Text**

|Situation	| HTTP Response |
|-----------|---------------|
|URI not known	| 404 Document Not Found |
|Document is Deprecated or not available	| 410 Gone (or 404 when 410 is unacceptable due to security/privacy policy) |
|Document Responder unable to format document in content types listed the 'Accept' field	| 406 Not Acceptable |
|HTTP request specified is otherwise not a legal value	| 403 Forbidden/Request Type Not Supported |
{: .grid}

The Document Responder may return other HTTP Status Codes. Guidance on handling Access Denied related to use of 200, 403 and 404 can be found in [ITI TF-2x: Appendix Z.7](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations).

The Document Responder should complement the returned error code with a human readable description of the error condition.

The Document Responder may return HTTP redirect responses (responses with HTTP Status Codes 301, 302, 303 or 307) in response to a request. See RFC7231 Section 6.4 Redirection 3xx. 

##### 2:3.68.4.2.3 Expected Actions

If the Document Responder returns an HTTP redirect response (HTTP status codes 301, 302, 303, or 307), the Document Consumer shall follow the redirect, but may stop processing if it detects a loop. See [RFC7231 Section 6.4 Redirection 3xx](https://tools.ietf.org/html/rfc7231#section-6.4).

The Document Consumer processes the results according to application-defined rules.

The .hash and .size, when populated, represent the content in the MIME type indicated in the DocumentReference.content.attachment.contentType. Note there are special .size and .hash handling for [On-Demand Documents](ITI-67.html#236742212-support-for-on-demand-documents) and [Delayed Document Assembly](ITI-67.html#236742213-support-for-delayed-document-assembly).

#### 2:3.68.4.3 CapabilityStatement Resource

Document Responders implementing this transaction shall provide a CapabilityStatement Resource as described in [ITI TF-2x: Appendix Z.3](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.3-capabilitystatement-resource) indicating the transaction has been implemented. 
* Requirements CapabilityStatement for [Document Consumer](CapabilityStatement-IHE.MHD.DocumentConsumer.html)
* Requirements CapabilityStatement for [Document Responder](CapabilityStatement-IHE.MHD.DocumentResponder.html)

### 2:3.68.5 Security Considerations

See [MHD Security Considerations](1335_security_considerations.html).

This transaction should not return information that the Document Consumer is not authorized to access. 

#### 2:3.68.5.1 Security Audit Considerations

The security audit criteria are similar to those for the Retrieve Document Set-b [ITI-43] transaction.

##### 2:3.68.5.1.1 Document Consumer Audit

The Document Consumer when grouped with ATNA Secure Node or Secure Application actor shall be able to record a [Retrieve Document Consumer Audit Event Log](StructureDefinition-IHE.MHD.RetrieveDocument.Audit.Consumer.html). [Audit Example for a Retrieve Document transaction from consumer perspective](AuditEvent-ex-auditRetrieveDocument-consumer.html). 

##### 2:3.68.5.1.2 Document Responder Audit

The Document Responder when grouped with ATNA Secure Node or Secure Application actor shall be able to record a [Retrieve Document Responder Audit Event Log](StructureDefinition-IHE.MHD.RetrieveDocument.Audit.Responder.html). [Audit Example for a Find Document Lists Transaction from responder perspective](AuditEvent-ex-auditRetrieveDocument-responder.html). 
