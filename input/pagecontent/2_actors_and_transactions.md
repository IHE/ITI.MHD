
This section defines the actors and transactions in this implementation guide.

Figure below shows the actors directly
involved in the MHD 
Profile and the relevant transactions between them.

![Figure 33.1-1: MHD Actor Diagram](ActorsAndTransactions.svg "Figure: MHD Actor Diagram")

<div style="clear: left"/>

**Figure33.1-1: MHD Actor Diagram**

Table 3-1 lists the transactions for each actor directly involved in the MHD Implementation Guide. To claim compliance with this guide, an actor shall
support all required transactions (labeled "R") and may support the
optional transactions (labeled "O").


<table border="1" borderspacing="0" style='border: 1px solid black; border-collapse: collapse'>
<caption>
<b>
Table 33.1-1: MHD Implementation Guide - Actors and Transactions
</b>
</caption>
<thead>
<tr class="odd" style='background: gray;'>
<th>Actors</th>
<th>Transactions</th>
<th>Optionality</th>
</tr>
</thead>
<tbody>
                
<tr class="even">
                        
<td rowspan="1">
<a href="2_actors_and_transactions.html#document-source">Document Source</a>
</td>
                        
<td>
<a href='ITI-65.html'>
                        Provide Document Bundle [ITI-65]
</a>
</td>
<td align='center'>
                        R
</td>
</tr>

<tr class="even">
                        
<td rowspan="1">
<a href="2_actors_and_transactions.html#document-recipient">Document Recipient</a>
</td>
                        
<td>
<a href='ITI-65.html'>
                        Provide Document Bundle [ITI-65]
</a>
</td>
<td align='center'>
                        R
</td>
</tr>
                    

                    
<tr class="even">
                        
<td rowspan="3">
<a href="2_actors_and_transactions.html#document-consumer">Document Consumer</a>
</td>
                        
<td>
<a href='ITI-66.html'>
                        Find Document Lists [ITI-66]
</a>
</td>
<td align='center'>
                        R
</td>
</tr>
                    
<tr class="odd">
                        
<td>
<a href='ITI-67.html'>
                        Find Document References [ITI-67]
</a>
</td>
<td align='center'>
                        R
</td>
</tr>

<tr class="even">
                        
<td>
<a href='ITI-68.html'>
                        Retrieve Document [ITI-68]
</a>
</td>
<td align='center'>
                        R
</td>
</tr>

                    
<tr class="odd">
                        
<td rowspan="3">
<a href="2_actors_and_transactions.html#document-responder">Document Responder</a>
</td>
                        
<td>
<a href='ITI-66.html'>
                        Find Document Lists [ITI-66]
</a>
</td>
<td align='center'>
                        R
</td>
</tr>
                    
<tr class="even">
                        
<td>
<a href='ITI-67.html'>
                        Find Document References [ITI-67]
</a>
</td>
<td align='center'>
                        R
</td>
</tr>

<tr class="odd">
                        
<td>
<a href='ITI-68.html'>
                        Retrieve Document [ITI-68]
</a>
</td>
<td align='center'>
                        R
</td>
</tr>                    
</tbody>
</table>
        
        
            

### Actors
The actors in this profile are described in more detail in the sections below.

#### Document Source

The Document Source is the producer and publisher of SubmissionSet, Folder, DocumentReference, and documents to a Document Recipient.
* [Document Source](CapabilityStatement-IHE.MHD.DocumentSource.html) with no options or all options
* [Document Source implementing Comprehensive Metadata Option](CapabilityStatement-IHE.MHD.DocumentSource.Comprehensive.html)
* [Document Source implementing UnContained Reference Option](CapabilityStatement-IHE.MHD.DocumentSource.UnContained.html)

#### Document Consumer

The Document Consumer queries Document Responder for SubmissionSet, Folder, and DocumentReference metadata meeting certain criteria and may retrieve selected documents.
* [Document Consumer](CapabilityStatement-IHE.MHD.DocumentConsumer.html)

#### Document Recipient

The Document Recipient receives documents and metadata sent by the Document Source.
* [Document Recipient](CapabilityStatement-IHE.MHD.DocumentRecipient.html) with no options or all options
* [Document Recipient implementing Comprehensive Metadata Option](CapabilityStatement-IHE.MHD.DocumentRecipient.Comprehensive.html)
* [Document Recipient implementing UnContained Reference Option](CapabilityStatement-IHE.MHD.DocumentRecipient.UnContained.html)

#### Document Responder

The Document Responder responds with SubmissionSet, Folder, and DocumentReference metadata in response to a search request; and responds with documents in response to a retrieve request; from a Document Consumer.        
* [Document Responder](CapabilityStatement-IHE.MHD.DocumentResponder.html) with no options or all options

### Actor Options

Options that may be selected for each actor in this implementation guide, are listed in Table 3.2-1 below. Dependencies 
between options when applicable are specified in notes.

<table border="1" style="border: 1px solid black; border-collapse: collapse">
    <caption><b>Table 33.2-1 Actor Options</b></caption>
    <thead>
        <tr style="background: gray;" class="odd">
            <td>Actor</td>
            <td>Option Name</td>
        </tr>
    </thead>
    <tbody>
        
                <tr>
                
                    <td rowspan='2'>Document Source</td>
                
                <td><a href="#comprehensive-metadata-option">Comprehensive Metadata</a></td>
                </tr>
                <tr>
                
                <td><a href="#uncontained-reference-option">UnContained Reference</a></td>
                </tr>

                <tr>
                
                    <td rowspan='3'>Document Recipient</td>
                
                <td><a href="#comprehensive-metadata-option">Comprehensive Metadata</a></td>
                </tr>
                <tr>
                
                <td><a href="#xds-on-fhir-option">XDS on FHIR</a></td>
                </tr>
                <tr>
                
                <td><a href="#uncontained-reference-option">UnContained Reference</a></td>
                </tr>
                        
                <tr>
                
                    <td rowspan='1'>Document Consumer</td>
                
                <td><a href="#uncontained-reference-option">UnContained Reference</a></td>
                </tr>
            
                <tr>
                
                    <td rowspan='2'>Document Responder</td>
                                
                <td><a href="#xds-on-fhir-option">XDS on FHIR</a></td>
                </tr>
                <tr>
                
                <td><a href="#uncontained-reference-option">UnContained Reference</a></td>
                </tr>
    </tbody>
</table>

        
The options in this guide are described in more detail in the sections below.

#### Comprehensive Metadata Option

Support of this option assures that the Document Source will provide comprehensive metadata. Comprehensive metadata fulfill the cardinality requirements of XDS. 

A Document Source that supports this option will provide metadata consistent with the additional document sharing requirements for an XDS Document Source described in [ITI TF-3: 4.3.1- Submission Metadata Attribute Optionality](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.3.html#4.3.1) and [ITI TF-3: 4.5.1 Metadata Object Types mapped to FHIR](metadata_maps.html).

A Document Recipient that supports this option will require that any metadata provided is consistent with the additional document sharing requirements for an XDS Document Source described in [ITI TF-3: 4.3.1- Submission Metadata Attribute Optionality](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.3.html#4.3.1).

#### XDS on FHIR Option

The Document Recipient that supports this option shall be able to be grouped with an [XDS](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html) [Document Source](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.1.1) so that any publication request is passed on to that XDS environment. See the transaction specific requirements outlined in [ITI-65 XDS on FHIR Option](ITI-65.html#xds-on-fhir-option). The grouped XDS Document Source shall implement the [Document Replacement Option](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.2.1), [Document Addendum Option](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.2.2), [Document Transformation Option](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.2.3), and [Folder Management Option](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.2.4) to ensure that these functionalities can be transferred from the MHD Document Source through to the [XDS Document Registry](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.1.3).

The Document Responder that supports this option shall be able to be grouped with an [XDS Document Consumer](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.1.2) so that any query or retrieve requests can be passed on to, and responded to, by an XDS environment. The transaction specific requirements are outlined in [ITI-66 XDS on FHIR Options](ITI-66.html#xds-on-fhir-option) and [ITI-67 XDS on FHIR Option](ITI-67.html#xds-on-fhir-option). 

The [XDS on FHIR Option](#xds-on-fhir-option) is not compatible with the [UnContained Reference Option](#uncontained-reference-option). A system may be able to support both options, but only one will be able to be used at a given deployment.

#### UnContained Reference Option

The [UnContained Reference Option](#uncontained-reference-option) recognizes that a Community may choose to longitudinally maintain their provider and patient directories, for example, an [mCSD](https://profiles.ihe.net/ITI/TF/Volume1/ch-46.html) Care Services Selective Supplier and [PMIR](https://profiles.ihe.net/ITI/TF/Volume1/ch-49.html) Patient Identity Manager. When this longitudinal consistency is managed, then the author, authenticator, sourcePatientInfo, and author entries do not need to be a contained copy of the information known at the time of publication [ITI-65](ITI-65.html) since a Reference to the information in these directories will be valid over the full lifecycle of the entries. 

The actors that support the [UnContained Reference Option](#uncontained-reference-option) shall be able to create and consume full URL values in the DocumentReference.author, the DocumentReference.authenticator, the DocumentReference.context.sourcePatientInfo, and the DocumentManifest.author. This requirement encourages the persisting of the information at the time the document is published. 

The [UnContained Reference Option](#uncontained-reference-option) is not compatible with the [XDS on FHIR Option](#xds-on-fhir-option). A system may be able to support both options, but only one will be able to be used at a given deployment.

### Transaction Descriptions
The transactions in this profile are summarized in the sections below.

#### Provide Document Bundle

This transaction is used to transfer documents and metadata and is analogous to a [Provide and Register Document Set-b ITI-41](https://profiles.ihe.net/ITI/TF/Volume2/ITI-41.html) transaction.

For more details see the detailed [ITI-65 transaction description](ITI-65.html)

#### Find Document Lists

This transaction is used to issue parameterize queries that result in a List resource representing a SubmissionSet or a Folder.

For more details see the detailed [ITI-66 transaction description](ITI-66.html)

#### Find Document References

This transaction is used to issue parameterized queries that result in a list of Document Reference resources.

For more details see the detailed [ITI-67 transaction description](ITI-67.html)

#### Retrieve Document

This transaction is used to get documents.

For more details see the detailed [ITI-68 transaction description](ITI-68.html)


**[Previous](1_overview.html) /   [Next](3_security_considerations.html)**

