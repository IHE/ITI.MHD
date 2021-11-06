
This section defines the actors and transactions in this implementation guide.

Figure below shows the actors directly
involved in the MHD 
Profile and the relevant transactions between them.

<div>
{%include ActorsAndTransactions.svg%}
</div>

<div style="clear: left"/>

**Figure 1:33.1-1: MHD Actor Diagram**

Table 1:33.1-1 lists the transactions for each actor directly involved in the MHD Implementation Guide. To claim compliance with this guide, an actor shall
support all required transactions (labeled "R") and may support the
optional transactions (labeled "O").


<table border="1" borderspacing="0" style='border: 1px solid black; border-collapse: collapse'>
<caption>
<b>
Table 1:33.1-1: MHD Implementation Guide - Actors and Transactions
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
<a href="1331_actors_and_transactions.html#133111-document-source">Document Source</a>
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
<a href="1331_actors_and_transactions.html#133113-document-recipient">Document Recipient</a>
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
<a href="1331_actors_and_transactions.html#133112-document-consumer">Document Consumer</a>
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
<a href="1331_actors_and_transactions.html#133114-document-responder">Document Responder</a>
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
        
        
            

### 1:33.1.1 Actor Descriptions and Actor Profile Requirements
The actors in this profile are described in more detail in the sections below.

#### 1:33.1.1.1 Document Source

The Document Source is the producer and publisher of SubmissionSet, Folder, DocumentReference, and documents to a Document Recipient.

The following CapabilityStatements define the Actor capabilities
* [Document Source](CapabilityStatement-IHE.MHD.DocumentSource.html) 
* [Document Source implementing Comprehensive Metadata Option](CapabilityStatement-IHE.MHD.DocumentSource.Comprehensive.html)
* [Document Source implementing UnContained Reference Option](CapabilityStatement-IHE.MHD.DocumentSource.UnContained.html)

#### 1:33.1.1.2 Document Consumer

The Document Consumer queries Document Responder for SubmissionSet, Folder, and DocumentReference metadata meeting certain criteria and may retrieve selected documents.

The following CapabilityStatements define the Actor capabilities
* [Document Consumer](CapabilityStatement-IHE.MHD.DocumentConsumer.html)

#### 1:33.1.1.3 Document Recipient

The Document Recipient receives documents and metadata sent by the Document Source.

The following CapabilityStatements define the Actor capabilities
* [Document Recipient](CapabilityStatement-IHE.MHD.DocumentRecipient.html)
* [Document Recipient implementing Comprehensive Metadata Option](CapabilityStatement-IHE.MHD.DocumentRecipient.Comprehensive.html)
* [Document Recipient implementing UnContained Reference Option](CapabilityStatement-IHE.MHD.DocumentRecipient.UnContained.html)

#### 1:33.1.1.4 Document Responder

The Document Responder responds with SubmissionSet, Folder, and DocumentReference metadata in response to a search request, and responds with documents in response to a retrieve request, from a Document Consumer.        

The following CapabilityStatements define the Actor capabilities
* [Document Responder](CapabilityStatement-IHE.MHD.DocumentResponder.html)

### 1:33.1.2 Transaction Descriptions
The transactions in this profile are summarized in the sections below.

#### 1:33.1.2.1 Provide Document Bundle

This transaction is used to transfer documents and metadata and is analogous to a [Provide and Register Document Set-b ITI-41](https://profiles.ihe.net/ITI/TF/Volume2/ITI-41.html) transaction.

For more details see the detailed [ITI-65 transaction description](ITI-65.html)

#### 1:33.1.2.2 Find Document Lists

This transaction is used to issue parameterize queries that result in a List resource representing a SubmissionSet or a Folder.

For more details see the detailed [ITI-66 transaction description](ITI-66.html)

#### 1:33.1.2.3 Find Document References

This transaction is used to issue parameterized queries that result in a list of Document Reference resources.

For more details see the detailed [ITI-67 transaction description](ITI-67.html)

#### 1:33.1.2.4 Retrieve Document

This transaction is used to get documents.

For more details see the detailed [ITI-68 transaction description](ITI-68.html)
