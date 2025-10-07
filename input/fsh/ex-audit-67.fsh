Instance: ex-auditFindDocumentReferences-consumer
InstanceOf: IHE.MHD.FindDocumentReferences.Audit.Consumer
Title: "Audit Example of ITI-67 at Consumer"
Description: "Audit Example for a Find Document References Transaction as recorded at the consumer"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* code = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #E
* category[anySearch] = http://hl7.org/fhir/restful-interaction#search "search"
* category[iti67] = urn:ihe:event-type-code#ITI-67 "Find Document References"
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
* entity[query].detail.type.text = "Query Description" 
* entity[query].detail.valueString = """
GET fhir.example.com/fhir/DocumentReference?patient=9876&status=current&type=http://loinc.org|1234-5
"""
* entity[query].query = "R0VUIHRlc3QuZmhpci5uZXQvZmhpci9Eb2N1bWVudFJlZmVyZW5jZT9wYXRpZW50PTk4NzYmc3RhdHVzPWN1cnJlbnQmdHlwZT1odHRwOi8vbG9pbmMub3JnfDEyMzQtNQo="


Instance: ex-auditFindDocumentReferences-responder
InstanceOf: IHE.MHD.FindDocumentReferences.Audit.Responder
Title: "Audit Example of ITI-67 at responder"
Description: "Audit Example for a Find Document References Transaction from responder perspective"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* code = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #E
* category[anySearch] = http://hl7.org/fhir/restful-interaction#search "search"
* category[iti67] = urn:ihe:event-type-code#ITI-67 "Find Document References"
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
* entity[query].detail.type.text = "Query Description" 
* entity[query].detail.valueString = """
GET fhir.example.com/fhir/DocumentReference?patient=9876&status=current&type=http://loinc.org|1234-5
"""
* entity[query].query = "R0VUIHRlc3QuZmhpci5uZXQvZmhpci9Eb2N1bWVudFJlZmVyZW5jZT9wYXRpZW50PTk4NzYmc3RhdHVzPWN1cnJlbnQmdHlwZT1odHRwOi8vbG9pbmMub3JnfDEyMzQtNQo="

Instance: ex-auditFindDocumentReferences-post-responder
InstanceOf: IHE.MHD.FindDocumentReferences.Audit.Responder
Title: "Audit Example of ITI-67 using POST recorded at responder"
Description: "Audit Example for a Find Document References Transaction using POST search as recorded at the responder perspective"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* code = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #E
* category[anySearch] = http://hl7.org/fhir/restful-interaction#search "search"
* category[iti67] = urn:ihe:event-type-code#ITI-67 "Find Document References"
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
* entity[query].detail.type.text = "Query Description" 
* entity[query].detail.valueString = """
POST fhir.example.com/fhir/DocumentReference/_search
Host fhir.example.com
Content-Type: application/x-www-form-urlencoded
Accept: application/fhir+json

patient=9876&status=current&type=http://loinc.org|1234-5
"""
* entity[query].query = "UE9TVCB0ZXN0LmZoaXIubmV0L2ZoaXIvRG9jdW1lbnRSZWZlcmVuY2UvX3NlYXJjaApIb3N0IHRlc3QuZmhpci5uZXQKQ29udGVudC1UeXBlOiBhcHBsaWNhdGlvbi94LXd3dy1mb3JtLXVybGVuY29kZWQKQWNjZXB0OiBhcHBsaWNhdGlvbi9maGlyK2pzb24KCnBhdGllbnQ9OTg3NiZzdGF0dXM9Y3VycmVudCZ0eXBlPWh0dHA6Ly9sb2luYy5vcmd8MTIzNC01Cg=="

