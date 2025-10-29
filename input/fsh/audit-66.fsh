Profile:        AuditFindDocumentListsConsumer
Parent:         IHE.BasicAudit.MHD5.PatientQuery
Id:             IHE.MHD.FindDocumentLists.Audit.Consumer
Title:          "Audit Event for Find Document Lists Transaction by the Document Consumer"
Description:    """
Defines constraints on the AuditEvent Resource to record when a Find Document Lists Transaction happens, as recorded by the Document Consumer.
- Build off of the IHE BasicAudit PatientQuery event
- add the ITI-67 as a subtype
- client is Document Consumer
- server is Document Responder
- entity slices for query, and patient are required
- entity slice for transaction is available
"""
* modifierExtension 0..0
* category 2..
* category contains iti66 1..1
* category[iti66] = urn:ihe:event-type-code#ITI-66 "Find Document Lists"
* agent[client] obeys val-audit-source
* agent[client] ^short = "Document Consumer"
* agent[server] ^short = "Document Responder"
* entity[patient] ^short = "Patient"
* entity[query] ^short = "Search Parameters"





Profile:        AuditFindDocumentListsResponder
Parent:         IHE.BasicAudit.MHD5.PatientQuery
Id:             IHE.MHD.FindDocumentLists.Audit.Responder
Title:          "Audit Event for Find Document Lists Transaction at Document Responder"
Description:    """
Defines constraints on the AuditEvent Resource to record when a Find Document Lists Transaction happens, as recorded by the Document Responder.
- Build off of the IHE BasicAudit PatientQuery event
- add the ITI-67 as a subtype
- client is Document Consumer
- server is Document Responder
- entity slices for query, and patient are required
- entity slice for transaction is available
"""
* modifierExtension 0..0
* category 2..
* category contains iti66 1..1
* category[iti66] = urn:ihe:event-type-code#ITI-66 "Find Document Lists"
* agent[server] obeys val-audit-source
* agent[client] ^short = "Document Consumer"
* agent[server] ^short = "Document Responder"
* entity[patient] ^short = "Patient"
* entity[query] ^short = "Search Parameters"

////////////////////////////////////// manually imported from iheitibasicaudit


Profile:        Create
Parent:         AuditEvent
Id:             IHE.BasicAudit.MHD5.Create
Title:          "Basic AuditEvent for a successful Create not related to a Patient"
Description:    """
A basic AuditEvent profile for when a RESTful Create action happens successfully.

- Given a Resource Create is requested 
- And that resource does not have a Patient subject or is otherwise associated with a Patient
  - when the resource is Patient specific then [PatientCreate](StructureDefinition-IHE.BasicAudit.MHD5.PatientCreate.html) is used
- And the request is authorized
  - Authorization failures should follow [FHIR core Access Denied](http://hl7.org/fhir/security.html#AccessDenied)
- When successful
  - Note a failure AuditEvent may follow this pattern, but would not be a successful outcome and should have an OperationOutcome
- Then the AuditEvent recorded will conform
"""
* code = http://terminology.hl7.org/CodeSystem/audit-event-type#rest // "Restful Operation"
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open // allow other codes
* category 1..
* category contains anyCreate 1..1 
* category[anyCreate] = http://hl7.org/fhir/restful-interaction#create // "create"
* action = #C
* recorded 1..1
// failures are recorded differently
* outcome.code = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 // "Success"
* outcome.code 1..
* agent ^slicing.discriminator.type = #value
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent 2..
* agent contains 
    client 1..1 and 
    server 1..1 and 
    user 0..1
* agent[client].type = DCM#110153 // "Source Role ID"
* agent[client].type 1..1
* agent[client].who 1..1 // client identifier, May be an Device Resource, but more likely an identifier given the App identified in the OAuth token 
* agent[client].network[x] 1..1 // as known by TCP connection information
* agent[server].type = DCM#110152 // "Destination Role ID"
* agent[server].type 1..1
* agent[server].who 1..1 // server identifier. May be a Device Resource, but likely just an identifier of the domain name
* agent[server].network[x] 1..1 // as known by TCP connection information
* agent[user].type from DataSources (required)
* agent[user].type 1..1
* agent[user].who 1..1 // May be a Resource, but likely just an identifier from the OAuth token
* agent[user].requestor = true
* agent[user].role MS // if the OAuth token includes any roles, they are recorded here
* agent[user].network[x] 0..0 // users are not network devices
* agent[user].policy MS // if the OAuth token includes a PurposeOfUse it is recorded here
* source MS // what agent recorded the event. Likely the client or server but might be an intermediary
* entity ^slicing.discriminator.type = #value
* entity ^slicing.discriminator.path = "role"
* entity ^slicing.rules = #open
* entity 1..
* entity contains 
	transaction 0..1 and
    data 1..1
* entity[transaction].role = BasicAuditEntityType#XrequestId
* entity[transaction].what.identifier.value 1..1
* entity[transaction].what.identifier.value ^short = "the value of X-Request-Id"
* entity[data].role from RestObjectRoles (required)
* entity[data].what 1..1
* entity[data].securityLabel ^short = "may contain the security labels on the resource returned"


Profile:        PatientCreate
Parent:         Create
Id:             IHE.BasicAudit.MHD5.PatientCreate
Title:          "Basic AuditEvent for a successful Create with known Patient subject"
Description:    """
A basic AuditEvent profile for when a RESTful Create action happens successfully, and where there is an identifiable Patient subject associated with the create of the Resource.

- Given a Resource Create is requested 
- And that resource has a Patient subject or is otherwise associated with a Patient
- And the request is authorized
  - Authorization failures should follow [FHIR core Access Denied](http://hl7.org/fhir/security.html#AccessDenied)
- When successful
  - Note a failure AuditEvent may follow this pattern, but would not be a successful outcome and should have an OperationOutcome
- Then the AuditEvent recorded will conform
"""
//* entity ^slicing.discriminator.type = #value
//* entity ^slicing.discriminator.path = "type"
//* entity ^slicing.rules = #open
* entity 2..
* entity contains 
    patient 1..1 
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 // "Patient"
* entity[patient].what 1..1
* entity[patient].what only Reference(Patient)




ValueSet: DataSources
Title: "participant source types for RESTful create"
Description: "create agent participant types for user operators that are in REST"
* ^experimental = false
* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#AUT "author (originator)"
* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#INF "Informant"
* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#CST "Custodian"

