Instance:   in-DocumentReferenceMinimalFullTextSearchPDF
InstanceOf: IHE.MHD.Minimal.DocumentReference
Usage: #inline
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.53432.348.12973.17740.34205.4355.50220.62012"
* identifier[entryUUID].system = "urn:ietf:rfc:3986"
* identifier[entryUUID].value = "urn:uuid:7d5bb8ac-68ee-4926-85e7-b8aac8e1f09d"
* identifier[entryUUID].use = #official
* status = #current
* content.attachment.contentType = #application/pdf
* content.attachment.url = "http://example.com/nowhere.pdf"


Instance:   ex-findDocumentReferencesResponseFullTextSearch
InstanceOf: IHE.MHD.FindDocumentReferencesResponseMessageFullTextSearch
Title:      "Example of a Find Document References Response Message with the Full-Text Search Option"
Description: "Example of a Find Document References Bundle search set containing a single DocumentReference and using the Full-Text Search Option"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #searchset
* link[+]
  * relation = "self"
  * url = "test.fhir.net/R4/fhir/DocumentReference?patient=9876&status=current"
* total = 1
* timestamp = 2021-04-16T11:32:24Z
* entry[DocumentReference]
  * fullUrl = "http://example.org/DocumentReference/in-DocumentReferenceMinimalFullTextSearchPDF"
  * resource = in-DocumentReferenceMinimalFullTextSearchPDF
  * search
    * mode = #match
    * score = 0.9
    * extension[matchSnippet][+]
      * extension[snippet].valueString = "The patient was diagnosed with <mark>hypertension</mark> and started on antihypertensive therapy."
      * extension[pageNumber].valueString = "1"
    * extension[matchSnippet][+]
      * extension[snippet].valueString = "A history of <mark>hypertension</mark> was noted during the previous hospital admission."
      * extension[pageNumber].valueString = "23"
    * extension[totalHits].valueInteger = 2
