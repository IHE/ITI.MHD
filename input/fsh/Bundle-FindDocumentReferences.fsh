Alias: $v2-0203 = http://terminology.hl7.org/CodeSystem/v2-0203
Alias: $sct = http://snomed.info/sct
Alias: $v3-Confidentiality = http://terminology.hl7.org/CodeSystem/v3-Confidentiality
Alias: $formatcode = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode

Instance: FindDocumentReferences
InstanceOf: IHE.MHD.FindDocumentReferencesComprehensiveResponseMessage
Title: "Example of a FindDocumentReferences Response Bundle"
Description: "An example of a searchset Bundle with one DocumentReference as returned by a FindDocumentReferences query"
Usage: #example
* meta.lastUpdated = "2020-10-14T07:56:23.916+00:00"
* type = #searchset
* total = 1
* link.relation = #self
* link.url = "http://example.com/DocumentReference?patient.identifier=urn:oid:2.999|11111111&status=current"
* entry.fullUrl = "urn:uuid:50383ae5-49e5-4dea-b0e6-660cb9e7b91f"
* entry.resource = 50383ae5-49e5-4dea-b0e6-660cb9e7b91f

Instance: 50383ae5-49e5-4dea-b0e6-660cb9e7b91f
InstanceOf: IHE.MHD.Comprehensive.DocumentReference
Usage: #inline
* identifier[uniqueId].system = "urn:ietf:rfc:3986"
* identifier[uniqueId].value = "urn:oid:1.3.6.1.4.1.12559.11.13.2.1.2951"
* identifier[uniqueId].use = #usual
* identifier[entryUUID].use = #official
* identifier[entryUUID].system = "urn:ietf:rfc:3986"
* identifier[entryUUID].value = "urn:uuid:50383ae5-49e5-4dea-b0e6-660cb9e7b91f"
* status = #current
* type = $sct#721912009 "Medication summary document (record artifact)"
* category = $sct#422735006 "Summary clinical document (record artifact)"
* subject = Reference(http://example.org/Patient/FranzMusterNeedsAbsoluteUrl)
* date = "2020-06-29T11:58:00.000+00:00"
* description = "2-7-MedicationCard"
* securityLabel = $v3-Confidentiality#N "normal"
* content.attachment.contentType = #text/xml
* content.attachment.language = #de-CH
* content.attachment.url = "http://example.com/xdsretrieve?uniqueId=urn:uuid:413eb0f7-aa72-4405-86a4-7793a23fcc27&repositoryUniqueId=2.999.756.42.1"
* content.attachment.creation = "2020-06-29T11:58:00+00:00"
* content.profile.valueCoding = $formatcode#urn:ihe:pharm:pml:2013
* facilityType = $sct#264358009 "General practice premises (environment)"
* practiceSetting = $sct#394802001 "General medicine (qualifier value)"
