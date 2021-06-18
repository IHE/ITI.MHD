

Instance:   cccccccc-2222-0000-0000-000000000001
InstanceOf: DocumentReference
Title:      "DocumentReference for Comprehensive fully filled metadata for a document in a Binary"
Description: "For bundling Example of a Comprehensive DocumentReference resource."
Usage: #inline
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #current
* type = http://loinc.org#60591-5
* category = http://loinc.org#11369-6
* date = 2020-02-01T23:50:50-05:00
// note that this resource is non MHD profiled DocumentReference, so the format code must follow FHIR core valueSet
//* content.format = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode#urn:ihe:iti:xds-sd:text:2008
//* content.format = http://ihe.net/fhir/ValueSet/IHE.FormatCode.codesystem#urn:ihe:iti:xds-sd:text:2008
* content.format = urn:oid:1.3.6.1.4.1.19376.1.2.3#urn:ihe:iti:xds-sd:text:2008
* content.attachment.url = "urn:uuid:cccccccc-2222-0000-0000-000000000002"
* content.attachment.contentType = #text/plain
* content.attachment.hash = "MGE0ZDU1YThkNzc4ZTUwMjJmYWI3MDE5NzdjNWQ4NDBiYmM0ODZkMA=="
* content.attachment.size = 11


Instance: cccccccc-2222-0000-0000-000000000002
InstanceOf: Binary
Title: "Dummy Binary document that says: Hello World"
Description: """
For Bundling Example binary that 
- holds \"Hello World\"
- size 11
- hash 0a4d55a8d778e5022fab701977c5d840bbc486d0
- base64 of the hash MGE0ZDU1YThkNzc4ZTUwMjJmYWI3MDE5NzdjNWQ4NDBiYmM0ODZkMA==
"""
Usage: #inline
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* contentType = #text/plain
* data = "SGVsbG8gV29ybGQ="

Instance:   ex-dummyBundleDocAndBinary
InstanceOf: Bundle
Title:      "Dummy Bundle with DocumentReference + Binary"
Description: "Dummy Bundle with a DocumentReferenece and Binary
- with 1 documentReference
- with 1 document Binary"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #transaction
* timestamp = 2020-11-24T23:50:50-05:00
* entry[+].fullUrl = "urn:uuid:cccccccc-2222-0000-0000-000000000001"
* entry[=].resource = cccccccc-2222-0000-0000-000000000001
* entry[=].request.url = "DocumentReference"
* entry[=].request.method = #POST
* entry[+].fullUrl = "urn:uuid:cccccccc-2222-0000-0000-000000000002"
* entry[=].resource = cccccccc-2222-0000-0000-000000000002
* entry[=].request.url = "Binary"
* entry[=].request.method = #POST

