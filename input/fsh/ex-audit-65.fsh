Instance: ex-auditProvideBundle-recipient
InstanceOf: IHE.MHD.ProvideBundle.Audit.Recipient
Title: "Audit Example of ITI-65 at recipient"
Description: "Audit Example for a Provide Bundle Transaction as recorded at the recipient"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://dicom.nema.org/resources/ontology/DCM#110107 "Import"
* action = #C
* subtype = urn:ihe:event-type-code#ITI-65 "Provide Document Bundle"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[0].type = http://dicom.nema.org/resources/ontology/DCM#110152 "Destination Role ID"
* agent[0].who = Reference(Device/ex-device)
* agent[0].requestor = false
* agent[0].network.address = "http://server.example.com/fhir"
* agent[0].network.type = http://hl7.org/fhir/network-type#5 "URI"
// not clear how a server uses the IUA Oauth token here
* agent[1].type = http://dicom.nema.org/resources/ontology/DCM#110153 "Source Role ID"
* agent[1].requestor = false
* agent[1].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[1].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
* agent[2].type = http://terminology.hl7.org/CodeSystem/v3-RoleClass#PAT "Patient" // the user is the patient
* agent[2].who.display = "John Smith" // just a display name pulled from the IUA token
* agent[2].requestor = true
* entity[0].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[0].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[0].what = Reference(Patient/ex-patient)
* entity[1].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[1].role = http://terminology.hl7.org/CodeSystem/object-role#20 "Job"
* entity[1].what = Reference(List/ex-minimalSubmissionSet)


Instance: ex-auditProvideBundle-source
InstanceOf: IHE.MHD.ProvideBundle.Audit.Source
Title: "Audit Example of ITI-65 at source"
Description: "Audit Example for a Provide Bundle Transaction from source perspective"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://dicom.nema.org/resources/ontology/DCM#110106 "Export"
* action = #R
* subtype = urn:ihe:event-type-code#ITI-65 "Provide Document Bundle"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "mobile app foo-bar"
* source.observer.display = "model number ABC, serial number 1234"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#1 "User Device"
* agent[0].type = http://dicom.nema.org/resources/ontology/DCM#110153 "Source Role ID"
* agent[0].who.display = "model number ABC, serial number 1234"
* agent[0].requestor = false
* agent[0].network.address = "myDevice.example.com"
* agent[0].network.type = http://hl7.org/fhir/network-type#1 "domain name"
* agent[1].type = http://dicom.nema.org/resources/ontology/DCM#110152 "Destination Role ID"
* agent[1].requestor = false
* agent[1].network.address = "http://server.example.com/fhir"
* agent[1].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[2].type = http://terminology.hl7.org/CodeSystem/v3-RoleClass#PAT "Patient" // the user is the patient
* agent[2].who = Reference(Patient/ex-patient)
* agent[2].requestor = true
* entity[0].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[0].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[0].what = Reference(Patient/ex-patient)
* entity[1].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[1].role = http://terminology.hl7.org/CodeSystem/object-role#20 "Job"
* entity[1].what = Reference(List/ex-minimalSubmissionSet)

