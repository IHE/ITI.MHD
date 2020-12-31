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
* content.attachment.title = "Hello World"

Instance: ex-list
InstanceOf: List
Title: "Dummy List example"
Description: "Dummy List example for completeness sake. No actual use of this resource other than an example target"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #current
* mode = #working
* entry.item = Reference(DocumentReference/ex-documentreference2)

Instance: ex-practitioner
InstanceOf: Practitioner
Title: "Dummy Practitioner example"
Description: "Dummy Practitioner example for completeness sake. No actual use of this resource other than an example target"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* telecom.system = #email
* telecom.value = "JohnMoehrke@gmail.com"
