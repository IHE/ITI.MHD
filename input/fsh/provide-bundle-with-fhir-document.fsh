Alias: $v3-ActReason = http://terminology.hl7.org/CodeSystem/v3-ActReason
Alias: $sct = http://snomed.info/sct
Alias: $MHDlistTypes = https://profiles.ihe.net/ITI/MHD/CodeSystem/MHDlistTypes
Alias: $loinc = http://loinc.org
Alias: $formatcode = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode
Alias: $v3-ActCode = http://terminology.hl7.org/CodeSystem/v3-ActCode
Alias: $dose-rate-type = http://terminology.hl7.org/CodeSystem/dose-rate-type
Alias: $allergyintolerance-clinical = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical
Alias: $allergyintolerance-verification = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification
Alias: $v3-Confidentiality = http://terminology.hl7.org/CodeSystem/v3-Confidentiality

Instance: ex-comprehensiveProvideDocumentBundleDocument
InstanceOf: IHE.MHD.Comprehensive.ProvideBundle
Title: "Example Provide Bundle with a FHIR-Document"
Description: "An example of a Comprehensive Provide Document Bundle containing a DocumentReference and a FHIR-Document Bundle. This is an example of using a FHIR-Document Bundle rather than a Binary resource to carry the document content."
Usage: #example
* meta.security = $v3-ActReason#HTEST
* type = #transaction
* timestamp = "2004-10-25T23:50:50-05:00"
* entry[SubmissionSet].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00888800001"
* entry[SubmissionSet].resource = aaaaaaaa-bbbb-cccc-dddd-e00888800001
* entry[SubmissionSet].request.method = #POST
* entry[SubmissionSet].request.url = "List"
* entry[DocumentRefs].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00888800002"
* entry[DocumentRefs].resource = aaaaaaaa-bbbb-cccc-dddd-e00888800002
* entry[DocumentRefs].request.method = #POST
* entry[DocumentRefs].request.url = "DocumentReference"
* entry[FhirDocuments].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00888800003"
* entry[FhirDocuments].resource = ex-fhir-document-bundle
//* entry[FhirDocuments].resource = father
* entry[FhirDocuments].request.method = #POST
* entry[FhirDocuments].request.url = "Bundle"

Instance: aaaaaaaa-bbbb-cccc-dddd-e00888800001
InstanceOf: IHE.MHD.Comprehensive.SubmissionSet
Usage: #inline
* meta.security = $v3-ActReason#HTEST
* extension[DesignationType].valueCodeableConcept = $sct#225728007
* extension[SourceId].valueIdentifier.value = "urn:oid:1.2.3.4"
* identifier[entryUUID].use = #official
* identifier[entryUUID].system = "urn:ietf:rfc:3986"
* identifier[entryUUID].value = "urn:uuid:5d3d3a7d-82a6-4fe0-8d87-ee2cb87fa219"
* identifier[uniqueId].use = #usual
* identifier[uniqueId].system = "urn:ietf:rfc:3986"
* identifier[uniqueId].value = "urn:oid:1.2.129.6.58.92.88337.1"
* status = #current
* mode = #working
* code = $MHDlistTypes#submissionset
* subject = Reference(http://example.org/fhir/Patient/fdoc-patient)
* date = "2004-10-25T23:50:50-05:00"
* entry.item = Reference(urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00888800002)

Instance: aaaaaaaa-bbbb-cccc-dddd-e00888800002
InstanceOf: IHE.MHD.Comprehensive.DocumentReference
Usage: #inline
* meta.security = $v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:uuid:0c3151bd-1cbf-4d64-b04d-cd9187a4c6e0"
* masterIdentifier.use = #usual
* identifier[entryUUID].system = "urn:ietf:rfc:3986"
* identifier[entryUUID].value = "urn:uuid:7d5bb8ac-68ee-4926-85e7-b8aac8e1f09d"
* identifier[entryUUID].use = #official
* status = #current
* type = $loinc#28655-9
* category = $loinc#11369-6
* subject = Reference(http://example.org/fhir/Patient/fdoc-patient)
* date = "2020-02-01T23:50:50-05:00"
* securityLabel = $v3-Confidentiality#N "normal"
* contained[+] = fdoc-practitioner
* author = Reference(fdoc-practitioner)  
* content.attachment.contentType = #application/fhir+json
* content.attachment.language = #en
* content.attachment.url = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00888800003"
* content.attachment.title = "Discharge Summary from Responsible Clinician"
* content.attachment.creation = "2013-05-28T22:12:21Z"
* content.format = $formatcode#urn:ihe:iti:xds:2017:mimeTypeSufficient
* context.encounter.identifier.system = "https://www.example.org/encounters"
* context.encounter.identifier.value = "S100"
* context.facilityType = $sct#82242000
* context.practiceSetting = $sct#408467006
* contained[+] = aaaaaaaa-bbbb-cccc-dddd-e00888800004
* context.sourcePatientInfo = Reference(aaaaaaaa-bbbb-cccc-dddd-e00888800004)

Instance:   aaaaaaaa-bbbb-cccc-dddd-e00888800004
InstanceOf: Patient
Title:      "Source Patient Info Patient example"
Description: "Source patient for push scenario, carried in containment for sourcePatientInfo. This content is preserved to hold the Patient information as it was known at publication time."
Usage: #inline
* name[+].family = "Schmidt"
* name[=].given = "Dee"
* identifier[+].system = "http://example.org/patients"
* identifier[=].value = "mrn-1234"


/* use the fdoc.fsh ex-fhir-document-bundle rather than replicating it here */
