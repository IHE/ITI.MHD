
* Actors

  - [Document Source](1331_actors_and_transactions.html#133111-document-source)

  - [Document Recipient](1331_actors_and_transactions.html#133113-document-recipient)

  - [Document Consumer](1331_actors_and_transactions.html#133112-document-consumer)

  - [Document Responder](1331_actors_and_transactions.html#133114-document-responder)

* Transactions

  - [Provide Document Bundle \[ITI-65\]](ITI-65.html)

  - [Find Document Lists \[ITI-66\]](ITI-66.html)

  - [Find Document References \[ITI-67\]](ITI-67.html)

  - [Retrieve Document \[ITI-68\]](ITI-68.html)

## 1:33.4 MHD Overview
The MHD Profile enables sharing of patient documents to, or from, mobile or constrained devices. Other IHE profiles, chiefly Cross-Enterprise Document Sharing (XDS), describe sharing of patient document in less constrained environments, and many of the concepts from those profiles are applicable to the MHD environment. For more information on IHE Document Sharing, see [Health Information Exchange: Enabling Document Sharing Using IHE Profiles](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) White Paper.

### 1:33.4.1 Concepts
The MHD Profile supports a broad set of the XDS use cases and functionality while keeping the implementation as simple as possible. The MHD Profile is focused on a subset of the use cases that XDS supports and does not try to reproduce the full scalability, flexibility, privacy, or security supported by a more robust XDS infrastructure. Example use cases are:

* Medical devices such as those targeted by the IHE Patient Care Devices (PCD) domain, submitting data in the form of documents.
* Kiosks used by patients in hospital registration departments.
* PHR publishing into a staging area for later import into an EHR or HIE.
* Patient or provider applications that are configured to securely connect to a PHR in order to submit healthcare history document (e.g., BlueButton+).
* Electronic measurement devices participating in XDW workflows and pulling medical history documents from an HIE.
* A General Practitioner physician’s office with minimal IT capabilities using a mobile application to connect to an HIE or EHR.

These specific use cases can be generalized into two broad use cases. The first is the general use case of publishing new document(s) from the mobile device. The second general use case is where the mobile device needs to discover available documents and retrieve documents of interest. There are clearly complex use cases that combine these two general use cases; however, they are not specifically described in this profile. When more complex use cases are encountered, use of one of the more robust Document Sharing profiles is more appropriate. 

### 1:33.4.2 Use Case 1: Publication of new Documents

#### 1:33.4.2.1 Publication of new documents Use Case Description
In this use case, a new document or set of documents is published from the mobile device. For example, a mobile device is a medical device that is submitting new health measurements, or a mobile device has a user-interface used to capture user input such as a Patient Consent. This device-created content is formed by the application, implementing the MHD Document Source, into a Document and submitted with the metadata.

This use case presumes that the mobile device knows or discovers the patient identity. The patient identity might be obtained through some IHE transactional method such as the Patient Demographics Query for Mobile [PDQm](https://profiles.ihe.net/ITI/TF/Volume1/ch-38.html) or Patient Identifier Cross-Reference for Mobile [PIXm](https://profiles.ihe.net/ITI/TF/Volume1/ch-41.html) Profile. The patient id might simply be entered via some device interface (RFID, Bar-Code), a user interface, or be specified in a configuration setting (e.g., mobile PHR application). The use case also allows for identity cross-referencing to be implemented by the Document Recipient. 

This use case presumes that the sending mobile device knows the location of the receiving URL endpoints, likely through a configuration setting, or through a workflow driven by a web interface.

#### 1:33.4.2.2 Publication of new documents Process Flow
The publication of a new document(s) is done using the Provide Document Bundle [ITI-65](ITI-65.html) transaction, which carries both the document and its metadata. This transaction is analogous to an XDS Provide and Register Document Set-b [ITI-41](https://profiles.ihe.net/ITI/TF/Volume2/ITI-41.html) transaction.

<div>
{%include usecase1-processflow.svg%}
</div>

<div style="clear: left"/>

**Figure 1:33.4.2.2-1: Use Case 1 Process Flow**

### 1:33.4.3 Use Case 2: Discovery and Retrieval of existing documents

#### 1:33.4.3.1 Discovery and Retrieval of existing documents Use Case Description
In this use case, the mobile device needs access to existing documents. For example, a mobile device involved in a workflow needs to determine the current state of the workflow, or the mobile device needs to discover the most current medical summary. 

#### 1:33.4.3.2 Discovery Retrieval of existing documents Process Flow
The Find Document References [\[ITI-67\]](ITI-67.html) transaction is used to issue parameterized queries that result in a list of DocumentReference Resources, where a DocumentReference Resource carries the XDS DocumentEntry metadata, which is metadata about a document.

Alternatively, the Find Document Lists [\[ITI-66\]](ITI-66.html) transaction is used to issue parameterized queries that result in a set of List Resources, where a List Resource carries the XDS SubmissionSet metadata for a set of DocumentEntry objects that were published as a set, or XDS Folder metadata for a set of DocumentEntry objects that are said to be members of the same grouping.

The Retrieve Document [\[ITI-68\]](ITI-68.html) transaction is used to get the document itself.

<div>
{%include usecase2-processflow.svg%}
</div>
<div style="clear: left"/>

**Figure 1:33.4.3.2-1: Basic Process Flow in MHD Profile**

### 1:33.4.4 Mapping to RESTful operators
The MHD Profile defines a set of transactions against FHIR Resources. These are summarized in Table 1:33.4.4-1. MHD does not use any additional extended or custom methods.

**Table 1:33.4.4-1: REST Methods and Resources**

| HTTP<br/>Method | Transactions on <br/> DocumentReference | Transactions on <br/> List | Transactions on Binary <br/> (document) |
|--------|----------------------------------|------------------------------|----------------------------|
| GET    | Find Document Reference [ITI-67] | Find Document Lists [ITI-66] | Retrieve Document [ITI-68] |
| PUT    | Not Specified                    | Not Specified                | Not Specified              |
| POST   | Provide Document Bundle [ITI-65] | Provide Document Bundle [ITI-65] | Provide Document Bundle [ITI-65] |
| DELETE | Not Specified                    | Not Specified                | Not Specified              |
| UPDATE | Not Specified                    | Not Specified                | Not Specified              |
| HEAD   | Not Specified                    | Not Specified                | Not Specified              |
| OPTIONS| Not Specified                    | Not Specified                | Not Specified              |
| TRACE  | Not Specified                    | Not Specified                | Not Specified              |
{: .grid}

Note: Items are marked *Not Specified* because the MHD Profile is focused on core Document Sharing (XDS, XDR, etc.) capability and is not trying to address the larger use-case of metadata update.
