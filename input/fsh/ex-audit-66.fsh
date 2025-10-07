Instance: ex-auditFindDocumentLists-consumer
InstanceOf: IHE.MHD.FindDocumentLists.Audit.Consumer
Title: "Audit Example of ITI-66 at Consumer"
Description: "Audit Example for a Find Document Lists Transaction as recorded at the consumer"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* code = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #E
* category[anySearch] = http://hl7.org/fhir/restful-interaction#search "search"
* category[iti66] = urn:ihe:event-type-code#ITI-66 "Find Document Lists"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome.code = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site.display = "fancy mobile app"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#1 "User Device"
* agent[client].type = DCM#110153 "Source Role ID"
* agent[client].who = Reference(Device/ex-device)
* agent[client].requestor = false
* agent[client].networkString = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
// not clear how a server uses the IUA Oauth token here
* agent[server].type = DCM#110152 "Destination Role ID"
* agent[server].who.display = "http://server.example.com/fhir"
* agent[server].requestor = false
* agent[server].networkUri = "http://server.example.com/fhir"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[query].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[query].query = "R0VUIHRlc3QuZmhpci5uZXQvUjQvZmhpci9MaXN0P3BhdGllbnQ9OTg3NiZjb2RlPXN1Ym1pc3Npb25zZXQmc3RhdHVzPWN1cnJlbnQmZGVzaWduYXRpb25UeXBlPWh0dHA6Ly9sb2luYy5vcmd8MTIzNC01Cg=="


Instance: ex-auditFindDocumentLists-responder
InstanceOf: IHE.MHD.FindDocumentLists.Audit.Responder
Title: "Audit Example of ITI-66 at responder"
Description: "Audit Example for a Find Document Lists Transaction from responder perspective"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* code = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #E
* category[anySearch] = http://hl7.org/fhir/restful-interaction#search "search"
* category[iti66] = urn:ihe:event-type-code#ITI-66 "Find Document Lists"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome.code = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site.display = "HIE MHD api example"
* source.observer.display = "http://server.example.com/fhir"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[client].type = DCM#110153 "Source Role ID"
* agent[client].who = Reference(Device/ex-device)
* agent[client].requestor = false
* agent[client].networkString = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
// not clear how a server uses the IUA Oauth token here
* agent[server].type = DCM#110152 "Destination Role ID"
* agent[server].who.display = "http://server.example.com/fhir"
* agent[server].requestor = false
* agent[server].networkUri = "http://server.example.com/fhir"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[query].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[query].query = "R0VUIHRlc3QuZmhpci5uZXQvUjQvZmhpci9MaXN0P3BhdGllbnQ9OTg3NiZjb2RlPXN1Ym1pc3Npb25zZXQmc3RhdHVzPWN1cnJlbnQmZGVzaWduYXRpb25UeXBlPWh0dHA6Ly9sb2luYy5vcmd8MTIzNC01Cg=="

