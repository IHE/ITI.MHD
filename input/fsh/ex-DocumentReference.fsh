Instance:   ex-DocumentReferenceMinimal
InstanceOf: IHE.MHD.Minimal.DocumentReference
Title:      "DocumentReference for Minimal metadata"
Description: "Example of a minimal DocumentReference resource. This is very unlikely to be acceptable anywhere, but it is the minimum required."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.53432.348.12973.17740.34205.4355.50220.62012"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:7d5bb8ac-68ee-4926-85e7-b8aac8e1f09d"
* status = #current
* content.attachment.contentType = #text/plain
* content.attachment.url = "http://example.com/nowhere.txt"

Instance:   ex-DocumentReferenceUnContained
InstanceOf: IHE.MHD.UnContained.Comprehensive.DocumentReference
Title:      "DocumentReference for Comprehensive minimally metadata"
Description: "Example of a Comprehensive DocumentReference resource. This is minimally filled for all mandatory elements."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46340"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:0c287d32-01e3-4d87-9953-9fcc9404eb21"
* status = #current
* content.attachment.contentType = #text/plain
* content.attachment.url = "http://example.com/nowhere.txt"
// elements moved to mandatory
* type = http://loinc.org#55107-7
* category = http://loinc.org#11369-6
* subject = Reference(Patient/ex-patient)
* date = 2020-12-31T23:50:50-05:00
* securityLabel = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N
* content.attachment.language = urn:ietf:bcp:47#en
* content.attachment.creation = 2020-12-31T23:50:50-05:00
* context.facilityType = http://snomed.info/sct#82242000
* context.practiceSetting =  http://snomed.info/sct#408467006
* content.format = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode#urn:ihe:iti:xds-sd:text:2008
* context.sourcePatientInfo = Reference(Patient/ex-patient)

Instance:   ex-DocumentReferenceUnContainedFully
InstanceOf: IHE.MHD.UnContained.Comprehensive.DocumentReference
Title:      "DocumentReference for Comprehensive minimally filled metadata"
Description: "Example of a UnContained References Option with Comprehensive DocumentReference resource. This is fully filled for all mandatory elements and optional elements."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46340"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:0c287d32-01e3-4d87-9953-9fcc9404eb21"
* status = #current
* content.attachment.contentType = #text/plain
* content.attachment.url = "http://example.com/nowhere.txt"
// elements moved to mandatory
* type = http://loinc.org#55107-7
* category = http://loinc.org#11369-6
* subject = Reference(Patient/ex-patient)
* date = 2020-12-31T23:50:50-05:00
* securityLabel = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N
* content.attachment.language = urn:ietf:bcp:47#en
* content.attachment.creation = 2020-12-31T23:50:50-05:00
* context.facilityType = http://snomed.info/sct#82242000
* context.practiceSetting =  http://snomed.info/sct#408467006
* content.format = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode#urn:ihe:iti:xds-sd:text:2008
// optional elements
* author = Reference(Practitioner/ex-practitioner)
* authenticator = Reference(Practitioner/ex-practitioner)
* context.sourcePatientInfo = Reference(Patient/ex-patient)
* context.period.start = 2020-12-31T23:50:50-05:00
* context.period.end = 2020-12-31T23:50:50-05:00
* context.event = http://terminology.hl7.org/CodeSystem/v3-ActCode#ACCTRECEIVABLE
* context.related.identifier.system = "urn:ietf:rfc:3986"
* context.related.identifier.value = "urn:oid:1.2.840.113556.1.8000.2554.17917.46600.21181.17878.33419.62048.57128.2759"
* content.format = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode#urn:ihe:iti:xds-sd:text:2008
* content.attachment.title = "DocumentReference for Comprehensive minimally filled metadata"
* description = "Example of a Comprehensive DocumentReference resource. This is minimally filled for all mandatory elements."
// note the sha1 hash of a zero file is da39a3ee5e6b4b0d3255bfef95601890afd80709
* content.attachment.hash = "ZGEzOWEzZWU1ZTZiNGIwZDMyNTViZmVmOTU2MDE4OTBhZmQ4MDcwOQ=="
* content.attachment.size = 0
* relatesTo.code = #appends
* relatesTo.target = Reference(DocumentReference/ex-documentreference)

Instance:   ex-DocumentReferenceComprehensive
InstanceOf: IHE.MHD.Comprehensive.DocumentReference
Title:      "DocumentReference for Comprehensive fully filled metadata"
Description: "Example of a Comprehensive DocumentReference resource. This is fully filled for all mandatory elements and all optional elements."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46340"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:0c287d32-01e3-4d87-9953-9fcc9404eb21"
* status = #current
* content.attachment.contentType = #text/plain
* content.attachment.url = "http://example.com/nowhere.txt"
// elements moved to mandatory
* type = http://loinc.org#55107-7
* category = http://loinc.org#11369-6
* subject = Reference(Patient/ex-patient)
* date = 2020-12-31T23:50:50-05:00
* securityLabel = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N
* content.attachment.language = urn:ietf:bcp:47#en
* content.attachment.creation = 2020-12-31T23:50:50-05:00
* context.facilityType = http://snomed.info/sct#82242000
* context.practiceSetting =  http://snomed.info/sct#408467006
* content.format = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode#urn:ihe:iti:xds-sd:text:2008
// optional elements
* author = Reference(in-author)
* authenticator = Reference(in-author)
* context.sourcePatientInfo = Reference(in-patient)
* contained[0] = in-author
* contained[1] = in-patient
* context.period.start = 2020-12-31T23:50:50-05:00
* context.period.end = 2020-12-31T23:50:50-05:00
* context.event = http://terminology.hl7.org/CodeSystem/v3-ActCode#ACCTRECEIVABLE
* context.related.identifier.system = "urn:ietf:rfc:3986"
* context.related.identifier.value = "urn:oid:1.2.840.113556.1.8000.2554.17917.46600.21181.17878.33419.62048.57128.2759"
* content.attachment.title = "DocumentReference for Comprehensive fully filled metadata"
* description = "Example of a Comprehensive DocumentReference resource. This is fully filled for all mandatory elements and all optional elements."
// note the sha1 hash of actual content should be used. This hash 8a38f2633006fd535149c44a3a73f312437b3478
// is of some random content.
* content.attachment.hash = "OGEzOGYyNjMzMDA2ZmQ1MzUxNDljNDRhM2E3M2YzMTI0MzdiMzQ3OA=="
* content.attachment.size = 190
* relatesTo.code = #appends
* relatesTo.target = Reference(DocumentReference/ex-documentreference)

Instance:   ex-DocumentReferenceComprehensiveDelayedAssembly
InstanceOf: IHE.MHD.Comprehensive.DocumentReference
Title:      "DocumentReference for Comprehensive fully filled metadata for a Deferred Creation"
Description: "Example of a Comprehensive DocumentReference resource. 
- This is fully filled for all mandatory elements and all optional elements.
- This specifies a Delayed Document Assembly Document.
  - Thus the hash is the fixed value da39a3ee5e6b4b0d3255bfef95601890afd80709
  - and the size is explicitly zero
  - and when a Document Consumer retrieves the URL, then the document will be assembled and returned to it
  - and the DocumentReference would be updated with the resulting hash and size thus becoming a static entry"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.47340"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:0c287d32-01e3-4d87-9953-9fcc9407eb21"
* status = #current
* content.attachment.contentType = #text/plain
// This URL would be used to retrieve the content, and in this case that is when the content would be created
* content.attachment.url = "http://example.com/nowhere.txt"
// elements moved to mandatory
* type = http://loinc.org#55107-7
* category = http://loinc.org#11369-6
* subject = Reference(Patient/ex-patient)
* date = 2020-12-31T23:50:50-05:00
* securityLabel = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N
* content.attachment.language = urn:ietf:bcp:47#en
* content.attachment.creation = 2020-12-31T23:50:50-05:00
* context.facilityType = http://snomed.info/sct#82242000
* context.practiceSetting =  http://snomed.info/sct#408467006
* content.format = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode#urn:ihe:iti:xds-sd:text:2008
// optional elements
* author = Reference(in-author)
* authenticator = Reference(in-author)
* context.sourcePatientInfo = Reference(in-patient)
* contained[0] = in-author
* contained[1] = in-patient
* context.period.start = 2020-12-31T23:50:50-05:00
* context.period.end = 2020-12-31T23:50:50-05:00
* context.event = http://terminology.hl7.org/CodeSystem/v3-ActCode#ACCTRECEIVABLE
* context.related.identifier.system = "urn:ietf:rfc:3986"
* context.related.identifier.value = "urn:oid:1.2.840.113556.1.8000.2554.17917.46600.21181.17878.33419.62048.57128.2759"
* content.attachment.title = "DocumentReference for Comprehensive fully filled metadata"
* description = "Example of a Comprehensive DocumentReference resource. This is fully filled for all mandatory elements and all optional elements."
// note the sha1 hash of a zero file is da39a3ee5e6b4b0d3255bfef95601890afd80709
* content.attachment.hash = "ZGEzOWEzZWU1ZTZiNGIwZDMyNTViZmVmOTU2MDE4OTBhZmQ4MDcwOQ=="
* content.attachment.size = 0
* relatesTo.code = #appends
* relatesTo.target = Reference(DocumentReference/ex-documentreference)

Instance:   ex-DocumentReferenceComprehensiveOnDemand
InstanceOf: IHE.MHD.Comprehensive.DocumentReference
Title:      "DocumentReference for Comprehensive fully filled metadata for a On-Demand document"
Description: "Example of a Comprehensive DocumentReference resource. 
- This is fully filled for all mandatory elements.
- This specifies a On-Demand Document.
  - Thus the hash is not provided
  - and the size is not provided
  - and when a Document Consumer retrieves the URL, then a new document will be created and returned to it
  - and a linked snapshot DocumentReference would be created with the resulting hash and size thus becoming a static entry"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.57340"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:0c287d32-01e3-4d87-9953-9fc59407eb21"
* status = #current
* content.attachment.contentType = #text/plain
// This URL would be used to retrieve the content, and in this case that is when the content would be created
* content.attachment.url = "http://example.com/nowhere.txt"
// elements moved to mandatory
* type = http://loinc.org#60591-5
* category = http://loinc.org#11369-6
* subject = Reference(Patient/ex-patient)
* date = 2020-01-31T23:50:50-05:00
* securityLabel = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N
* content.attachment.language = urn:ietf:bcp:47#en
* content.attachment.creation = 2020-12-31T23:50:50-05:00
* context.facilityType = http://snomed.info/sct#82242000
* context.practiceSetting =  http://snomed.info/sct#408467006
* content.format = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode#urn:ihe:iti:xds-sd:text:2008
// note the size and hash are NOT included at all
* context.sourcePatientInfo = Reference(in-patient)
* contained[0] = in-patient


Instance:   ex-DocumentReferenceComprehensiveWithBinary
InstanceOf: IHE.MHD.Comprehensive.DocumentReference
Title:      "DocumentReference for Comprehensive fully filled metadata for a document in a Binary"
Description: "Example of a Comprehensive DocumentReference resource. 
- This is fully filled for all mandatory elements.
- This specifies a Document in a Binary."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41381.57340"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:0c287d32-01e3-4d87-9953-91c59407eb21"
* status = #current
* content.attachment.contentType = #text/plain
* type = http://loinc.org#60591-5
* category = http://loinc.org#11369-6
* subject = Reference(Patient/ex-patient)
* date = 2020-02-01T23:50:50-05:00
* securityLabel = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#R
* context.facilityType = http://snomed.info/sct#82242000
* context.practiceSetting =  http://snomed.info/sct#408467006
* content.format = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode#urn:ihe:iti:xds-sd:text:2008
* context.sourcePatientInfo = Reference(in-patient)
* contained[0] = in-patient
* content.attachment.language = urn:ietf:bcp:47#en
* content.attachment.creation = 2020-02-01T23:50:50-05:00
* content.attachment.url = "Binary/ex-b-binary"
* content.attachment.title = "Hello World"
* content.attachment.contentType = #text/plain
* content.attachment.hash = "MGE0ZDU1YThkNzc4ZTUwMjJmYWI3MDE5NzdjNWQ4NDBiYmM0ODZkMA=="
* content.attachment.size = 11

Instance: ex-b-binary
InstanceOf: Binary
Title: "Example document that says: Hello World"
Description: "Example binary that holds just Hello World
- size 11
- hash 0a4d55a8d778e5022fab701977c5d840bbc486d0
- base64 of the hash MGE0ZDU1YThkNzc4ZTUwMjJmYWI3MDE5NzdjNWQ4NDBiYmM0ODZkMA=="
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* contentType = #text/plain
* data = "SGVsbG8gV29ybGQ="

Instance:   in-patient
InstanceOf: Patient
Title:      "Dummy inline Patient example"
Description: "Dummy inline patient example for completeness sake. No actual use of this resource other than an example target"
Usage: #inline


Instance: in-author
InstanceOf: Practitioner
Title: "Dummy inline Practitioner example"
Description: "Dummy inline Practitioner example for completeness sake. No actual use of this resource other than an example target"
Usage: #inline
* telecom.system = #email
* telecom.value = "JohnMoehrke@gmail.com"


Instance:   ex-findDocumentReferencesResponse
InstanceOf: IHE.MHD.FindDocumentReferencesResponseMessage
Title:      "Example of a Find Document References Response Message"
Description: "Example of a Find Document References Bundle Search Set with a single DocumentReference"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #searchset
* link[0].relation = "self"
* link[0].url = "test.fhir.net/R4/fhir/DocumentReference?patient=9876&status=current"
* total = 1
* timestamp = 2021-04-16T11:32:24Z
* entry[0].fullUrl = "http://example.org/DocumentReference/ex-DocumentReferenceMinimal"
* entry[0].resource = in-DocumentReferenceMinimal

Instance:   in-DocumentReferenceMinimal
InstanceOf: IHE.MHD.Minimal.DocumentReference
Title:      "DocumentReference for Minimal metadata"
Description: "Example of a minimal DocumentReference resource. This is very unlikely to be acceptable anywhere, but it is the minimum required."
Usage: #inline
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.53432.348.12973.17740.34205.4355.50220.62012"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:7d5bb8ac-68ee-4926-85e7-b8aac8e1f09d"
* status = #current
* content.attachment.contentType = #text/plain
* content.attachment.url = "http://example.com/nowhere.txt"
