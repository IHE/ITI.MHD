
Instance:   ex-patient
InstanceOf: Patient
Title:      "Dummy Patient example"
Description: "Dummy patient example for completeness sake. No actual use of this resource other than an example target"
Usage: #example
// history - http://playgroundjungle.com/2018/02/origins-of-john-jacob-jingleheimer-schmidt.html
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* name[+].use = #usual
* name[=].family = "Schmidt"
* name[=].given = "John"
* name[+].use = #old
* name[=].family = "Schnidt"
* name[=].given[+] = "John"
* name[=].given[+] = "Jacob"
* name[=].given[+] = "Jingle"
* name[=].given[+] = "Heimer"
* name[=].period.end = "1960"
* name[+].use = #official
* name[=].family = "Schmidt"
* name[=].given[+] = "John"
* name[=].given[+] = "Jacob"
* name[=].given[+] = "Jingleheimer"
* name[=].period.start = "1960-01-01"
* name[+].use = #nickname
* name[=].family = "Schmidt"
* name[=].given = "Jack"
* gender = #other
* birthDate = "1923-07-25"
* address.state = "WI"
* address.country = "USA"

Instance:   ex-device
InstanceOf: Device
Title:      "Dummy Device example"
Description: "Dummy Device example for completeness sake. No actual use of this resource other than an example target"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST

Instance:   ex-organization
InstanceOf: Organization
Title:      "Dummy Organization example"
Description: "Dummy Organization example for completeness sake. No actual use of this resource other than an example target"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* name = "nowhere"

Instance: ex-documentreference
InstanceOf: DocumentReference
Title: "Dummy DocumentReference example"
Description: "Dummy DocumentReference example for completeness sake. No actual use of this resource other than an example target"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #current
* content.attachment.title = "Hello World"
* content.attachment.contentType = #text/plain

Instance: ex-documentreference2
InstanceOf: DocumentReference
Title: "Dummy DocumentReference 2 example"
Description: "Dummy DocumentReference 2 example for completeness sake. No actual use of this resource other than an example target"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #current
* content.attachment.title = "Hello World"
* content.attachment.contentType = #text/plain

Instance: ex-b-binary
InstanceOf: Binary
Title: "Example document that says: Hello World"
Description: "Example binary that holds just Hello World"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* contentType = #text/plain
* data = "SGVsbG8gV29ybGQ="

Instance: ex-list
InstanceOf: List
Title: "Dummy List example"
Description: "Dummy List example for completeness sake. No actual use of this resource other than an example target"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #current
* mode = #working
* entry.item = Reference(DocumentReference/ex-documentreference2)

Instance: ex-practitioner
InstanceOf: Practitioner
Title: "Dummy Practitioner example"
Description: "Dummy Practitioner example for completeness sake. No actual use of this resource other than an example target"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* telecom.system = #email
* telecom.value = "JohnMoehrke@gmail.com"





Instance:   ex-dummyProvideDocumentBundle
InstanceOf: Bundle
Title:      "Dummy Provide Document Bundle"
Description: "Example of a Provide Document Bundle transaction made up of the right FHIR resources, but these FHIR resources are not compliant with the MHD constraints. 
- A robust Document Recipient is allowed to consume this if it has business rules that allow it."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #transaction
* timestamp = 2020-11-24T23:50:50-05:00
* entry[+].resource =          593cd04e-b696-45c1-bc32-d00000000001
* entry[=].fullUrl = "urn:uuid:593cd04e-b696-45c1-bc32-d00000000001"
* entry[=].request.url = "List"
* entry[=].request.method = #POST
* entry[+].resource =          593cd04e-b696-45c1-bc32-d00000000002
* entry[=].fullUrl = "urn:uuid:593cd04e-b696-45c1-bc32-d00000000002"
* entry[=].request.url = "DocumentReference"
* entry[=].request.method = #POST

Instance: 593cd04e-b696-45c1-bc32-d00000000002
InstanceOf: List
Title: "Dummy List example"
Description: "Dummy List example for completeness sake. No actual use of this resource other than an example target"
Usage: #inline
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #current
* mode = #working
* entry.item = Reference(urn:uuid:593cd04e-b696-45c1-bc32-d00000000001)

Instance: 593cd04e-b696-45c1-bc32-d00000000001
InstanceOf: DocumentReference
Title: "Dummy DocumentReference example"
Description: "Dummy DocumentReference example for completeness sake. No actual use of this resource other than an example target"
Usage: #inline
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #current
* content.attachment.title = "Hello World"
* content.attachment.contentType = #text/plain

