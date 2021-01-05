Instance:   ex-DocumentReferenceMinimal
InstanceOf: IHE.MHD.Minimal.DocumentReference
Title:      "DocumentReference for Minimal metadata"
Description: "Example of a minimal DocumentReference resource. This is very unlikely to be acceptable anywhere, but it is the minimum required."
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
* content.format = http://ihe.net/fhir/ValueSet/IHE.FormatCode.codesystem#urn:ihe:iti:xds-sd:text:2008
* context.sourcePatientInfo = Reference(Patient/ex-patient)

Instance:   ex-DocumentReferenceUnContainedFully
InstanceOf: IHE.MHD.UnContained.Comprehensive.DocumentReference
Title:      "DocumentReference for Comprehensive minimally filled metadata"
Description: "Example of a UnContained Comprehensive DocumentReference resource. This is fully filled for all mandatory elements and optional elements."
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
* content.format = http://ihe.net/fhir/ValueSet/IHE.FormatCode.codesystem#urn:ihe:iti:xds-sd:text:2008
// optional elements
* author = Reference(Practitioner/ex-practitioner)
* authenticator = Reference(Practitioner/ex-practitioner)
* context.sourcePatientInfo = Reference(Patient/ex-patient)
* context.period.start = 2020-12-31T23:50:50-05:00
* context.period.end = 2020-12-31T23:50:50-05:00
* context.event = http://terminology.hl7.org/CodeSystem/v3-ActCode#ACCTRECEIVABLE
* context.related.identifier.system = "urn:ietf:rfc:3986"
* context.related.identifier.value = "urn:oid:1.2.840.113556.1.8000.2554.17917.46600.21181.17878.33419.62048.57128.2759"
* content.format = http://ihe.net/fhir/ValueSet/IHE.FormatCode.codesystem#urn:ihe:iti:xds-sd:text:2008
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
* content.format = http://ihe.net/fhir/ValueSet/IHE.FormatCode.codesystem#urn:ihe:iti:xds-sd:text:2008
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

