Instance: ex-auditGenerateMetadata-recipient
InstanceOf: IHE.MHD.GenerateMetadata.Audit.Recipient
Title: "Audit Example of ITI-106 at recipient"
Description: "Audit Example for a Generate Metadata Transaction as recorded at the recipient"
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
* entity[data].what = Reference(DocumentReference/ex-DocumentReferenceMinimal)


Instance: ex-auditGenerateMetadata-source
InstanceOf: IHE.MHD.GenerateMetadata.Audit.Source
Title: "Audit Example of ITI-106 at source"
Description: "Audit Example for a Generate Metadata Transaction from source perspective"
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
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
* entity[data].what = Reference(ex-binary)

