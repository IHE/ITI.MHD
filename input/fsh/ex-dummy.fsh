Instance:   ex-patient
InstanceOf: Patient
Title:      "Dummy Patient example"
Description: "Dummy patient example for completeness sake. No actual use of this resource other than an example target"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST

Instance:   ex-device
InstanceOf: Device
Title:      "Dummy Device example"
Description: "Dummy Device example for completeness sake. No actual use of this resource other than an example target"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST

Instance:   ex-organization
InstanceOf: Organization
Title:      "Dummy Organization example"
Description: "Dummy Organization example for completeness sake. No actual use of this resource other than an example target"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* name = "nowhere"

Instance: ex-documentreference
InstanceOf: DocumentReference
Title: "Dummy DocumentReference example"
Description: "Dummy DocumentReference example for completeness sake. No actual use of this resource other than an example target"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #current
* content.attachment.title = "Hello World"

Instance: ex-documentreference2
InstanceOf: DocumentReference
Title: "Dummy DocumentReference 2 example"
Description: "Dummy DocumentReference 2 example for completeness sake. No actual use of this resource other than an example target"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #current
// TODO: figure out how to get Binary attachments in sushi
//* content.attachment.url = "Binary/ex-b-binary"
* content.attachment.title = "Hello World"

Instance: ex-b-binary
InstanceOf: Binary
Title: "Example document that says: Hello World"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* contentType = #text/plain
* data = "SGVsbG8gV29ybGQ="

Instance: ex-list
InstanceOf: List
Title: "Dummy List example"
Description: "Dummy List example for completeness sake. No actual use of this resource other than an example target"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #current
* mode = #working
* entry.item = Reference(DocumentReference/ex-documentreference2)

Instance: ex-list2
InstanceOf: List
Title: "Dummy List 2 example"
Description: "Dummy List 2 example for completeness sake. No actual use of this resource other than an example target"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #current
* mode = #working
//* entry.item = Reference(List/ex-list)

Instance: ex-practitioner
InstanceOf: Practitioner
Title: "Dummy Practitioner example"
Description: "Dummy Practitioner example for completeness sake. No actual use of this resource other than an example target"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* telecom.system = #email
* telecom.value = "JohnMoehrke@gmail.com"





// TODO: This is intended to be a dummy example that is not compliant but is structurally right. That is it is made up of the right kinds of FHIR resources, but not of the MHD profiles
Instance:   ex-dummyProvideDocumentBundle
InstanceOf: DummyProvideDocumentBundle
Title:      "Dummy Provide Document Bundle with Minimal metadata"
Description: "Example of a minimal Provide Document Bundle."
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #transaction
* timestamp = 2020-11-24T23:50:50-05:00
* entry[Lists].resource = 593cd04e-b696-45c1-bc32-39e55a340a48
* entry[Lists].fullUrl = "urn:uuid:593cd04e-b696-45c1-bc32-39e55a340a48"
* entry[Lists].request.url = "List"
* entry[Lists].request.method = #POST
* entry[1].resource = 593cd04e-b696-45c1-bc32-39e55a340a47
* entry[1].fullUrl = "urn:uuid:593cd04e-b696-45c1-bc32-39e55a340a47"
* entry[1].request.url = "DocumentReference"
* entry[1].request.method = #POST

Instance: 593cd04e-b696-45c1-bc32-39e55a340a48
InstanceOf: List
Title: "Dummy List example"
Description: "Dummy List example for completeness sake. No actual use of this resource other than an example target"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #current
* mode = #working
* entry.item = Reference(urn:uuid:593cd04e-b696-45c1-bc32-39e55a340a47)

Instance: 593cd04e-b696-45c1-bc32-39e55a340a47
InstanceOf: DocumentReference
Title: "Dummy DocumentReference example"
Description: "Dummy DocumentReference example for completeness sake. No actual use of this resource other than an example target"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #current
* content.attachment.title = "Hello World"


Profile:        DummyProvideDocumentBundle
Parent:         Bundle
Id:             IHE.MHD.Dummy.ProvideBundle
Title:          "MHD Dummy Provide Document Bundle"
Description:    "A profile on the Bundle transaction for Provide Document resources with Dummy metadata for MHD.
* all resources are just core FHIR resources
* shall be a Bundle
* shall be a Transaction
* shall have one or more List resources
* may have one or more DocumentReference
* may have one or more Binary
* may have one or more Patient
* can not have anything else (closed)
"
* type = #transaction
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry ^slicing.description = "Slicing based on the resource type of the entry"
* entry contains 
    Lists 1..* and
    DocRefs 0..* and
    Bin 0..* and
    Pat 0..1
* entry[Lists].resource only List
* entry[Lists] ^short = "SubmissionSet and Folders"
* entry[Lists] ^definition = "The SubmissionSet and Folders defines who submitted it, why they submitted it, when they submitted, what is in it, and where it is destine."
* entry[Lists].request.method = #POST
* entry[Lists].request.url 1..1
* entry[Lists].fullUrl 1..1
* entry[DocRefs].resource only DocumentReference
* entry[DocRefs] ^short = "DocumentReference resources"
* entry[DocRefs] ^definition = "The DocumentReference resources to be published or pushed."
* entry[DocRefs].request.method = #POST
* entry[DocRefs].request.url 1..1
* entry[DocRefs].fullUrl 1..1
* entry[Bin].resource only Binary
* entry[Bin] ^short = "Binary resources"
* entry[Bin] ^definition = "The document bits in a Binary resources to be published or pushed."
* entry[Bin].request.method = #POST
* entry[Bin].request.url 1..1
* entry[Bin].fullUrl 1..1
* entry[Pat].resource only Patient
* entry[Pat] ^short = "Patient"
* entry[Pat] ^definition = "The Patient is unusual, and only allowed in PUSH scenarios."
* entry[Pat].request.method = #POST
* entry[Pat].request.url 1..1
* entry[Pat].fullUrl 1..1



