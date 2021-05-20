Instance: ex-auditFindDocumentLists-consumer
InstanceOf: IHE.MHD.FindDocumentLists.Audit.Consumer
Title: "Audit Example of ITI-66 at Consumer"
Description: "Audit Example for a Find Document Lists Transaction as recorded at the consumer"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://dicom.nema.org/resources/ontology/DCM#110112 "Query"
* action = #E
* subtype = urn:ihe:event-type-code#ITI-66 "Find Document Lists"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "fancy mobile app"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#1 "User Device"
* agent[documentConsumer].type = DCM#110153 "Source Role ID"
* agent[documentConsumer].who = Reference(Device/ex-device)
* agent[documentConsumer].requestor = false
* agent[documentConsumer].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[documentConsumer].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
// not clear how a server uses the IUA Oauth token here
* agent[documentResponder].type = DCM#110152 "Destination Role ID"
* agent[documentResponder].who.display = "http://server.example.com/fhir"
* agent[documentResponder].requestor = false
* agent[documentResponder].network.address = "http://server.example.com/fhir"
* agent[documentResponder].network.type = http://hl7.org/fhir/network-type#5 "URI"
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[queryParameters].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[queryParameters].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[queryParameters].query = "R0VUIHRlc3QuZmhpci5uZXQvUjQvZmhpci9MaXN0P3BhdGllbnQ9OTg3NiZjb2RlPXN1Ym1pc3Npb25zZXQmc3RhdHVzPWN1cnJlbnQmZGVzaWduYXRpb25UeXBlPWh0dHA6Ly9sb2luYy5vcmd8MTIzNC01Cg=="


Instance: ex-auditFindDocumentLists-responder
InstanceOf: IHE.MHD.FindDocumentLists.Audit.Responder
Title: "Audit Example of ITI-66 at responder"
Description: "Audit Example for a Find Document Lists Transaction from responder perspective"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://dicom.nema.org/resources/ontology/DCM#110112 "Query"
* action = #E
* subtype = urn:ihe:event-type-code#ITI-66 "Find Document Lists"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "HIE MHD api example"
* source.observer.display = "http://server.example.com/fhir"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[documentConsumer].type = DCM#110153 "Source Role ID"
* agent[documentConsumer].who = Reference(Device/ex-device)
* agent[documentConsumer].requestor = false
* agent[documentConsumer].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[documentConsumer].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
// not clear how a server uses the IUA Oauth token here
* agent[documentResponder].type = DCM#110152 "Destination Role ID"
* agent[documentResponder].who.display = "http://server.example.com/fhir"
* agent[documentResponder].requestor = false
* agent[documentResponder].network.address = "http://server.example.com/fhir"
* agent[documentResponder].network.type = http://hl7.org/fhir/network-type#5 "URI"
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[queryParameters].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[queryParameters].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[queryParameters].query = "R0VUIHRlc3QuZmhpci5uZXQvUjQvZmhpci9MaXN0P3BhdGllbnQ9OTg3NiZjb2RlPXN1Ym1pc3Npb25zZXQmc3RhdHVzPWN1cnJlbnQmZGVzaWduYXRpb25UeXBlPWh0dHA6Ly9sb2luYy5vcmd8MTIzNC01Cg=="

