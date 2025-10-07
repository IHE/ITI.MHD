Instance: ex-auditSimplifiedPublish-recipient
InstanceOf: IHE.MHD.SimplifiedPublish.Audit.Recipient
Title: "Audit Example of ITI-105 at recipient"
Description: "Audit Example for a Simplified Publish Transaction as recorded at the recipient"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* recorded = 2020-04-29T09:49:00.000Z
* outcome.code = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site.display = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[client].type = DCM#110153 "Source Role ID"
* agent[client].requestor = false
* agent[client].who.display = "myMachine.example.org"
* agent[client].networkString = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[server].type = DCM#110152 "Destination Role ID"
* agent[server].who = Reference(Device/ex-device)
* agent[server].requestor = false
* agent[server].networkUri = "http://server.example.com/fhir"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
* entity[data].what = Reference(DocumentReference/ex-DocumentReferenceSimplifiedPublish)
//* entity[2].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
//* entity[2].role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
//* entity[2].what = Reference(DocumentReference/ex-DocumentReferenceSimplifiedPublish)

Instance: ex-auditSimplifiedPublish-source
InstanceOf: IHE.MHD.SimplifiedPublish.Audit.Source
Title: "Audit Example of ITI-105 at source"
Description: "Audit Example for a Simplified Publish Transaction from source perspective"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* recorded = 2020-04-29T09:49:00.000Z
* outcome.code = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site.display = "mobile app foo-bar"
* source.observer.display = "model number ABC, serial number 1234"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#1 "User Device"
* agent[server].type = DCM#110152 "Destination Role ID"
* agent[server].who = Reference(Device/ex-device)
* agent[server].requestor = false
* agent[server].networkUri = "http://server.example.com/fhir"
* agent[client].type = DCM#110153 "Source Role ID"
* agent[client].requestor = false
* agent[client].who.display = "model number ABC, serial number 1234"
* agent[client].networkString = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
* entity[data].what = Reference(DocumentReference/ex-DocumentReferenceSimplifiedPublish)

