Instance: ex-auditFindDocumentReferences-consumer
InstanceOf: IHE.MHD.FindDocumentReferences.Audit.Consumer
Title: "Audit Example of ITI-67 at Consumer"
Description: "Audit Example for a Find Document References Transaction as recorded at the consumer"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://dicom.nema.org/resources/ontology/DCM#110112 "Query"
* action = #E
* subtype = urn:ihe:event-type-code#ITI-67 "Find Document References"
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
* entity[queryParameters].description = """
GET test.fhir.net/R4/fhir/DocumentReference?patient=9876&status=current&type=http://loinc.org|1234-5
"""
* entity[queryParameters].query = "R0VUIHRlc3QuZmhpci5uZXQvUjQvZmhpci9Eb2N1bWVudFJlZmVyZW5jZT9wYXRpZW50PTk4NzYmc3RhdHVzPWN1cnJlbnQmdHlwZT1odHRwOi8vbG9pbmMub3JnfDEyMzQtNQo="


Instance: ex-auditFindDocumentReferences-responder
InstanceOf: IHE.MHD.FindDocumentReferences.Audit.Responder
Title: "Audit Example of ITI-67 at responder"
Description: "Audit Example for a Find Document References Transaction from responder perspective"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://dicom.nema.org/resources/ontology/DCM#110112 "Query"
* action = #E
* subtype = urn:ihe:event-type-code#ITI-67 "Find Document References"
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
* entity[queryParameters].description = """
GET test.fhir.net/R4/fhir/DocumentReference?patient=9876&status=current&type=http://loinc.org|1234-5
"""
* entity[queryParameters].query = "R0VUIHRlc3QuZmhpci5uZXQvUjQvZmhpci9Eb2N1bWVudFJlZmVyZW5jZT9wYXRpZW50PTk4NzYmc3RhdHVzPWN1cnJlbnQmdHlwZT1odHRwOi8vbG9pbmMub3JnfDEyMzQtNQo="

Instance: ex-auditFindDocumentReferences-post-responder
InstanceOf: IHE.MHD.FindDocumentReferences.Audit.Responder
Title: "Audit Example of ITI-67 using POST recorded at responder"
Description: "Audit Example for a Find Document References Transaction using POST search as recorded at the responder perspective"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://dicom.nema.org/resources/ontology/DCM#110112 "Query"
* action = #E
* subtype = urn:ihe:event-type-code#ITI-67 "Find Document References"
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
* entity[queryParameters].description = """
POST test.fhir.net/R4/fhir/DocumentReference/_search
Host test.fhir.net
Content-Type: application/x-www-form-urlencoded
Accept: application/fhir+json; fhirVersion=4.0

patient=9876&status=current&type=http://loinc.org|1234-5
"""
* entity[queryParameters].query = "UE9TVCB0ZXN0LmZoaXIubmV0L1I0L2ZoaXIvRG9jdW1lbnRSZWZlcmVuY2UvX3NlYXJjaApIb3N0IHRlc3QuZmhpci5uZXQKQ29udGVudC1UeXBlOiBhcHBsaWNhdGlvbi94LXd3dy1mb3JtLXVybGVuY29kZWQKQWNjZXB0OiBhcHBsaWNhdGlvbi9maGlyK2pzb247IGZoaXJWZXJzaW9uPTQuMAoKcGF0aWVudD05ODc2JnN0YXR1cz1jdXJyZW50JnR5cGU9aHR0cDovL2xvaW5jLm9yZ3wxMjM0LTUK"

