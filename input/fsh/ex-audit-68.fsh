Instance: ex-auditRetrieveDocument-consumer
InstanceOf: IHE.MHD.RetrieveDocument.Audit.Consumer
Title: "Audit Example of ITI-68 at consumer"
Description: "Audit Example for a Retrieve Document Transaction as recorded at the consumer"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = DCM#110107 "Import"
* action = #C
* subtype = urn:ihe:event-type-code#ITI-68 "Retrieve Document"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "mobile app foo-bar"
* source.observer.display = "model number ABC, serial number 1234"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#1 "User Device"
* agent[0].type = DCM#110152 "Destination Role ID"
* agent[0].who = Reference(Device/ex-device)
* agent[0].requestor = false
* agent[0].network.address = "http://server.example.com/fhir"
* agent[0].network.type = http://hl7.org/fhir/network-type#5 "URI"
// not clear how a server uses the IUA Oauth token here
* agent[1].type = DCM#110153 "Source Role ID"
* agent[1].requestor = false
* agent[1].who.display = "model number ABC, serial number 1234"
* agent[1].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[1].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
* entity[0].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[0].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[0].what = Reference(Patient/ex-patient)
* entity[1].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[1].role = http://terminology.hl7.org/CodeSystem/object-role#3 "Report"
* entity[1].what.reference = "http://example.org/blah/blah.pdf"


Instance: ex-auditRetrieveDocument-responder
InstanceOf: IHE.MHD.RetrieveDocument.Audit.Responder
Title: "Audit Example of ITI-68 at responder"
Description: "Audit Example for a Retrieve Document Transaction from responder perspective"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = DCM#110106 "Export"
* action = #R
* subtype = urn:ihe:event-type-code#ITI-68 "Retrieve Document"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "server.example.com"
* source.observer.display = "http://server.example.com/fhir"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[0].type = DCM#110152 "Destination Role ID"
* agent[0].requestor = false
* agent[0].who.display = "http://server.example.com/fhir"
* agent[0].network.address = "http://server.example.com/fhir"
* agent[0].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[1].type = DCM#110153 "Source Role ID"
* agent[1].who.display = "model number ABC, serial number 1234"
* agent[1].requestor = false
* agent[1].network.address = "myDevice.example.com"
* agent[1].network.type = http://hl7.org/fhir/network-type#1 "domain name"
* entity[0].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[0].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[0].what = Reference(Patient/ex-patient)
* entity[1].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[1].role = http://terminology.hl7.org/CodeSystem/object-role#3 "Report"
* entity[1].what.reference = "http://example.org/blah/blah.pdf"

