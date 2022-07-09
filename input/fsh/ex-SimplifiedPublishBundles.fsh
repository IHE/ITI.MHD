// Simplefied Publish style ITI-105, one DocumentReference and the Document

Instance: ex-response-simplifiedPublish
InstanceOf: IHE.MHD.ProvideDocumentBundleResponse 
Title:      "Response to Simplified Publish with minimal metadata of one document"
Description: """
Response bundle example given ex-simplifiedPublish
- for every entry in order given
  - successful create of DocumentReference
  - successful create of Binary
"""
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #transaction-response
* link[0].relation = "self"
* link[0].url = "http://example.com/fhir"
* entry[+].response.status = "201 Created"
* entry[=].response.location = "DocumentReference/1"
* entry[=].response.lastModified = "2020-10-02T11:56:15.095+00:00"
* entry[+].response.status = "201 Created"
* entry[=].response.location = "Binary/1"
* entry[=].response.lastModified = "2020-10-02T11:56:15.096+00:00"

// note uses resources from the minimal example
Instance:   ex-simplifiedPublish
InstanceOf: IHE.MHD.Simplified.PublishBundle
Title:      "Simplified Publish Document Bundle with Minimal metadata ofone document"
Description: """
Example of a Simplified Publish Bundle.
- The bundle contains
  - DocumentReference - One DocumentReference
  - Binary - the document
"""
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #transaction
* timestamp = 2004-10-25T23:50:50-05:00
* entry[DocumentRefs].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00222200002"
* entry[DocumentRefs].resource = aaaaaaaa-bbbb-cccc-dddd-e00222200002
* entry[DocumentRefs].request.url = "DocumentReference"
* entry[DocumentRefs].request.method = #POST
* entry[Documents].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00222200003"
* entry[Documents].resource = aaaaaaaa-bbbb-cccc-dddd-e00222200003
* entry[Documents].request.url = "Binary"
* entry[Documents].request.method = #POST

