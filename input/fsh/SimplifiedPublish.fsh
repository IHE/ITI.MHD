// Simplified Publish style ITI-105, one DocumentReference with .data holding the Document

Profile:        SimplifiedPublishDocumentReference
Parent:         DocumentReference
Id:             IHE.MHD.SimplifiedPublish.DocumentReference
Title:          "MHD DocumentReference for Simplified Publish"
Description:    """
A profile on the DocumentReference resource for MHD Simplified Publish constraints. 
- MHD is based on the [IHE Document Sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) model, 
- the [3:4.1 Abstract Metadata Model](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.1.html#4.1), and 
- the use defined here is FHIR DocumentReference implementation of the 
- ebRIM implementation at [3:4.2.3.2 Document Entry](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2).
- with use-cases and constraints found in [3:4.3 Additional Document Sharing Requirements](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.3.html#4.3)

Simplified Publish
- Similar to Minimal Metadata constraints
  - must be status current
  - must have a patient indicated
- uses attachment.data to carry the document, rather than attachment.url
  - so that the Simplified Publish is a simple POST of the DocumentReference
  - Document Recipient is expected to extract the .data, use .url
"""
* modifierExtension 0..0
* masterIdentifier 1..1
* identifier 0..0
* status 1..1
* status = http://hl7.org/fhir/document-reference-status#current
* docStatus 0..0
* type 0..1 MS
* category 0..1 MS
* subject 1..1
* subject only Reference(Patient)
* date 0..1 MS
* author 0..* MS
* authenticator 0..1
* relatesTo 0..* MS
* description 0..1
* securityLabel 0..* MS
* content 1..1
* content ^definition = "The document and format referenced."
* content.attachment.contentType 1..1
* content.attachment.language 0..1 MS
* content.attachment.data 1..1
* content.attachment.data ^short = "The document is contained in the .data element, base64 encoded"
* content.attachment.url 0..0
* content.attachment.size 0..1
* content.attachment.hash 0..1
* content.attachment.title 0..1
* content.attachment.creation 0..1 MS
* content.format 0..1 MS
//* content.format from http://ihe.net/fhir/ihe.formatcode.fhir/ValueSet/formatcode (preferred)
* context.event 0..*
* context.period 0..1 MS
* context.facilityType 0..1 MS
* context.practiceSetting 0..1 MS
* context.sourcePatientInfo 0..1 MS
* context.related 0..*





Instance:   ex-DocumentReferenceSimplifiedPublish
InstanceOf: IHE.MHD.SimplifiedPublish.DocumentReference
Title:      "DocumentReference for Simplified Publish with an encounter"
Description: "Example of a Simplified Publish DocumentReference resource. This has minimal metadata plus an encounter and custodian."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.53432.348.12973.17740.34205.4355.60220.62012"
* status = #current
* content.attachment.contentType = #text/plain
* content.attachment.data = "SGVsbG8gV29ybGQ="
* subject = Reference(Patient/ex-patient)
* context.encounter = Reference(ex-encounter)
* custodian = Reference(ex-organization)
