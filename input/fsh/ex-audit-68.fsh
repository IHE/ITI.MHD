Instance: ex-auditRetrieveDocument-consumer
InstanceOf: IHE.MHD.RetrieveDocument.Audit.Consumer
Title: "Audit Example of ITI-68 at consumer"
Description: "Audit Example for a Retrieve Document Transaction as recorded at the consumer"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* code = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #R
* category[anyRead] = http://hl7.org/fhir/restful-interaction#read "read"
* category[iti68] = urn:ihe:event-type-code#ITI-68 "Retrieve Document"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome.code = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site.display = "mobile app foo-bar"
* source.observer.display = "model number ABC, serial number 1234"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#1 "User Device"
* agent[server].type = DCM#110153 "Source Role ID"
* agent[server].who = Reference(Device/ex-device)
* agent[server].requestor = false
* agent[server].networkUri = "http://server.example.com/fhir"
* agent[client].type = DCM#110152 "Destination Role ID"
* agent[client].requestor = false
* agent[client].who.display = "model number ABC, serial number 1234"
* agent[client].networkString = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#3 "Report"
* entity[data].what.reference = "http://example.org/blah/blah.pdf"


Instance: ex-auditRetrieveDocument-responder
InstanceOf: IHE.MHD.RetrieveDocument.Audit.Responder
Title: "Audit Example of ITI-68 at responder"
Description: "Audit Example for a Retrieve Document Transaction from responder perspective"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* code = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #R
* category[anyRead] = http://hl7.org/fhir/restful-interaction#read "read"
* category[iti68] = urn:ihe:event-type-code#ITI-68 "Retrieve Document"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome.code = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site.display = "server.example.com"
* source.observer.display = "http://server.example.com/fhir"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[server].type = DCM#110153 "Source Role ID"
* agent[server].requestor = false
* agent[server].who.display = "http://server.example.com/fhir"
* agent[server].networkUri = "http://server.example.com/fhir"
* agent[client].type = DCM#110152 "Destination Role ID"
* agent[client].who.display = "model number ABC, serial number 1234"
* agent[client].requestor = false
* agent[client].networkUri = "myDevice.example.com"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#3 "Report"
* entity[data].what.reference = "http://example.org/blah/blah.pdf"

