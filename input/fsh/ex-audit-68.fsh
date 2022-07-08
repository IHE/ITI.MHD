Instance: ex-auditRetrieveDocument-consumer
InstanceOf: IHE.MHD.RetrieveDocument.Audit.Consumer
Title: "Audit Example of ITI-68 at consumer"
Description: "Audit Example for a Retrieve Document Transaction as recorded at the consumer"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #R
* subtype[anyRead] = http://hl7.org/fhir/restful-interaction#read "read"
* subtype[iti68] = urn:ihe:event-type-code#ITI-68 "Retrieve Document"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "mobile app foo-bar"
* source.observer.display = "model number ABC, serial number 1234"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#1 "User Device"
* agent[server].type = DCM#110153 "Source Role ID"
* agent[server].who = Reference(Device/ex-device)
* agent[server].requestor = false
* agent[server].network.address = "http://server.example.com/fhir"
* agent[server].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[client].type = DCM#110152 "Destination Role ID"
* agent[client].requestor = false
* agent[client].who.display = "model number ABC, serial number 1234"
* agent[client].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[client].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[data].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#3 "Report"
* entity[data].what.reference = "http://example.org/blah/blah.pdf"


Instance: ex-auditRetrieveDocument-responder
InstanceOf: IHE.MHD.RetrieveDocument.Audit.Responder
Title: "Audit Example of ITI-68 at responder"
Description: "Audit Example for a Retrieve Document Transaction from responder perspective"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #R
* subtype[anyRead] = http://hl7.org/fhir/restful-interaction#read "read"
* subtype[iti68] = urn:ihe:event-type-code#ITI-68 "Retrieve Document"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "server.example.com"
* source.observer.display = "http://server.example.com/fhir"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[server].type = DCM#110153 "Source Role ID"
* agent[server].requestor = false
* agent[server].who.display = "http://server.example.com/fhir"
* agent[server].network.address = "http://server.example.com/fhir"
* agent[server].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[client].type = DCM#110152 "Destination Role ID"
* agent[client].who.display = "model number ABC, serial number 1234"
* agent[client].requestor = false
* agent[client].network.address = "myDevice.example.com"
* agent[client].network.type = http://hl7.org/fhir/network-type#1 "domain name"
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[data].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#3 "Report"
* entity[data].what.reference = "http://example.org/blah/blah.pdf"

