
The Mobile access to Health Documents (MHD) Profile defines one standardized interface to health documents (a.k.a. an Application Programming Interface (API)) for use by mobile devices so that deployment of mobile applications is more consistent and reusable. The transactions defined here leverage the document content- and format-agnostic metadata concepts from XDS but simplify them for access in constrained environments including mobile devices. The MHD Profile does not replace XDS. Mobile devices, and other resource-constrained systems, can use MHD to access to an XDS Repository. The following figure shows one possible way to implement MHD within a document sharing environment (that may be, but is not necessarily, XDS-based). This implementation choice is not mandatory, and we recognize other architectures will be implemented. 

### About This Guide

This is an experimental project to show how to publish an IHE Profile using FHIR and Sushi. The profile prototyped is the Mobile access to Health Documents (MHD). The text contained is also including some future profile changes to utalize List resource for both SubmissionSet and Folder.

### Mobile access to Health Documents (MHD)

Applications specific to resource-constrained and mobile devices are an emerging platform for healthcare-enhancing software. The MHD Profile is not limited to mobile devices, using the term “mobile” only as a grouping for mobile applications, mobile devices or any other systems that are resource and platform-constrained. These constraints may drive the implementer to use simpler network interface technology. There are numerous deployed implementations of Document Sharing that need a simpler network interface technology, for example those hosted by a Health Information Exchange (HIE), large health provider electronic health record (EHR), or personal health record (PHR). 

The Mobile access to Health Documents (MHD) Profile defines one standardized interface to health documents (a.k.a. an Application Programming Interface (API)) for use by mobile devices so that deployment of mobile applications is more consistent and reusable. In this context, mobile devices include tablets, smartphones, and embedded devices including home-health devices. This profile is also applicable to more capable systems where needs are simple, such as pulling the latest summary for display. The critical aspects of the ‘mobile device’ are that it is resource-constrained, has a simple programming environment (e.g., JSON, JavaScript), simple protocol stack (e.g., HTTP), and simple display functionality (e.g., HTML browser). The goal is, in part, to avoid burdening the client with additional libraries such as those that are necessary to process SOAP, WSSE, MIME-Multipart, MTOM/XOP, ebRIM, and multi-depth XML. 

The Mobile access to Health Documents (MHD) Profile defines one pair of actors and a transaction to submit or push new “document entries” from the mobile device to a receiving system. Another set of actors and transactions is used to query a list of “document entries” having specific metadata, and to retrieve a document. 

This profile leverages the metadata concepts from XDS but simplifies the transaction requirements for access by mobile devices. 

The MHD Profile does not replace XDS. Rather, it enables simplified access by mobile devices to an XDS (or a similar) document management environment containing health information.

The Mobile Cross-Enterprise Document Data Element Extraction (mXDE) Profile combines MHD with the PCC Query for Existing Data for Mobile (QEDm) Profile to provide element level access to the medical information available in a Document Sharing exchange.

## MHD Actors, and Transactions

* Actors

  - [Document Source](2_actors_and_transactions.html#document-source)

  - [Document Recipient](2_actors_and_transactions.html#document-recipient)

  - [Document Consumer](2_actors_and_transactions.html#document-consumer)

  - [Document Responder](2_actors_and_transactions.html#document-responder)

* Transactions

  - [Provide Document Bundle ITI-65](transaction-65.html)

  - [Find Document Manifests ITI-66](transaction-66.html)

  - [Find Document References ITI-67](transaction-67.html)

  - [Retrieve Document ITI-68](transaction-68.html)

## MHD Overview
The MHD Profile enables sharing of patient documents to, or from, mobile or constrained devices. Other IHE profiles, chiefly Cross-Enterprise Document Sharing (XDS), describe sharing of patient document in less constrained environments, and many of the concepts from those profiles are applicable to the MHD environment. For more information on IHE Document Sharing, see “Health Information Exchange: Enabling Document Sharing Using IHE Profiles” whitepaper.

### Concepts
The MHD Profile supports a broad set of the XDS use cases and functionality while keeping the implementation as simple as possible. The MHD Profile is focused on a subset of the use cases that XDS supports and does not try to reproduce the full scalability, flexibility, privacy, or security supported by a more robust XDS infrastructure. Example use cases are:

* Medical devices such as those targeted by the IHE Patient Care Devices (PCD) domain, submitting data in the form of documents.
* Kiosks used by patients in hospital registration departments.
* PHR publishing into a staging area for later import into an EHR or HIE.
* Patient or provider applications that are configured to securely connect to a PHR in order to submit healthcare history document (e.g., BlueButton+).
* Electronic measurement devices participating in XDW workflows and pulling medical history documents from an HIE.
* A General Practitioner physician’s office with minimal IT capabilities using a mobile application to connect to an HIE or EHR.

These specific use cases can be generalized into two broad use cases. The first is the general use case of publishing new document(s) from the mobile device. The second general use case is where the mobile device needs to discover available documents and retrieve documents of interest. There are clearly complex use cases that combine these two general use cases; however, they are not specifically described in this profile. When more complex use cases are encountered, use of one of the more robust Document Sharing profiles is more appropriate. 

### Use Case 1: Publication of new Documents

#### Publication of new documents Use Case Description
In this use case, a new document or set of documents is published from the mobile device. For example, a mobile device is a medical device that is submitting new health measurements, or a mobile device has a user-interface used to capture user input such as a Patient Consent. This device-created content is formed by the application, implementing the MHD Document Source, into a Document and submitted with the metadata.
This use case presumes that the mobile device knows or discovers the patient identity. The patient identity might be obtained through some IHE transactional method such as the Patient Demographics Query for Mobile (PDQm) or Patient Identifier Cross-Reference for Mobile (PIXm) Profile. The patient id might simply be entered via some device interface (RFID, Bar-Code), a user interface, or be specified in a configuration setting (e.g., mobile PHR application). The use case also allows for identity cross-referencing to be implemented by the Document Recipient. 
This use case presumes that the sending mobile device knows the location of the receiving URL endpoints, likely through a configuration setting, or through a workflow driven by a web interface.
#### Publication of new documents Process Flow
The publication of a new document(s) is done using the Provide Document Bundle [ITI-65](transaction-65.html) transaction, which carries both the document and its metadata. This transaction is analogous to an XDS Provide and Register Document Set-b [ITI-41] transaction.

![Figure: Use Case 1 process flow](usecase1-processflow.svg "Figure: Use Case 1 process flow")

<div style="clear: left"/>

**Figure: Use Case 1 Process Flow**

### Use Case 2: Discovery and Retrieval of existing documents

#### Discovery and Retrieval of existing documents Use Case Description
In this use case, the mobile device needs access to existing documents. For example, a mobile device involved in a workflow needs to determine the current state of the workflow, or the mobile device needs to discover the most current medical summary. 

#### Discovery Retrieval of existing documents Process Flow
The Find Document References [ITI-67](transaction-67.html) transaction is used to issue parameterized queries that result in a list of DocumentReference Resources, where a DocumentReference Resource carries the XDS DocumentEntry metadata, which is metadata about a document.

Alternatively, the Find Document Manifest [ITI-66](transaction-66.html) transaction is used to issue parameterized queries that result in a set of DocumentManifest Resources, where a DocumentManifest Resource carries the XDS SubmissionSet metadata, which is a container for a set of DocumentEntry objects that were published as a set.

The Retrieve Document [ITI-68](transaction-68.html) transaction is used to get the document itself.

![Figure: Use Case 2 process flow](usecase2-processflow.svg "Figure: Use Case 2 process flow")

<div style="clear: left"/>

**Figure: Use Case 2 Process Flow**

### Mapping to RESTful operators
The MHD Profile defines a set of transactions against FHIR Resources. These are summarized in Table 33.4.4-1. MHD does not use any additional extended or custom methods.

TODO insert table

**Footnotes**
