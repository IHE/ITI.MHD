Profile:        AuditFindDocumentReferencesConsumer
Parent:         IHE.BasicAudit.MHD5.PatientQuery
Id:             IHE.MHD.FindDocumentReferences.Audit.Consumer
Title:          "Audit Event for Find Document References Transaction at Document Consumer"
Description:    """
Defines constraints on the AuditEvent Resource to record when a Find Document References Transaction happens, as recorded by the Document Consumer.
- Build off of the IHE BasicAudit PatientQuery event
- add the ITI-67 as a subtype
- client is Document Consumer
- server is Document Responder
- entity slices for query, and patient are required
- entity slice for transaction is available
"""
* modifierExtension 0..0
* category 2..
* category contains iti67 1..1
* category[iti67] = urn:ihe:event-type-code#ITI-67 "Find Document References"
* agent[client] obeys val-audit-source
* agent[client] ^short = "Document Consumer"
* agent[server] ^short = "Document Responder"
* entity[patient] ^short = "Patient"
* entity[query] ^short = "Search Parameters"



Profile:        AuditFindDocumentReferencesResponder
Parent:         IHE.BasicAudit.MHD5.PatientQuery
Id:             IHE.MHD.FindDocumentReferences.Audit.Responder
Title:          "Audit Event for Find Document References Transaction at Document Responder"
Description:    """
Defines constraints on the AuditEvent Resource to record when a Find Document References Transaction happens, as recorded by the Document Responder.
- Build off of the IHE BasicAudit PatientQuery event
- add the ITI-67 as a subtype
- client is Document Consumer
- server is Document Responder
- entity slices for query, and patient are required
- entity slice for transaction is available"""
* modifierExtension 0..0
* category 2..
* category contains iti67 1..1
* category[iti67] = urn:ihe:event-type-code#ITI-67 "Find Document References"
* agent[server] obeys val-audit-source
* agent[client] ^short = "Document Consumer"
* agent[server] ^short = "Document Responder"
* entity[patient] ^short = "Patient"
* entity[query] ^short = "Search Parameters"

/////////////////////////////////////// manually imported from iheitibasicaudit

////////////////////////////////////////////////////////////// Query Profile ////////////////////////
ValueSet: AllSearchVS
Title: "all Searches"
Description: "ValueSet of the restful-interaction searches"
* ^experimental = false
* http://hl7.org/fhir/restful-interaction#search // "search"
* http://hl7.org/fhir/restful-interaction#search-type // "search-type"
* http://hl7.org/fhir/restful-interaction#search-system // "search-system"


Profile:        Query
Parent:         AuditEvent
Id:             IHE.BasicAudit.MHD5.Query
Title:          "Basic AuditEvent for a successful Query"
Description:    """
A basic AuditEvent profile for when a RESTful Query / Search action happens successfully.

- Given a RESTful Query is requested
- And the request does not have a Patient subject indicated
  - The requestor logging the event would potentially not know they have requested Patient specific data
  - The data objects may not be patient specific kind of objects
  - when the request is Patient specific then [PatientQuery](StructureDefinition-IHE.BasicAudit.MHD5.PatientQuery.html) is used
- And the request is authorized
  - Authorization failures should follow [FHIR core Access Denied](http://hl7.org/fhir/security.html#AccessDenied)
- When successful
  - Note a failure AuditEvent may follow this pattern, but would not be a successful outcome and should have an OperationOutcome
  - Note success may result in zero or more results. The number of results and the content of the results are not recorded.
- And the results are not Patient specific
  - when the results are Patient specific then [PatientQuery](StructureDefinition-IHE.BasicAudit.MHD5.PatientQuery.html) are used
- Then the AuditEvent recorded will conform
  - The raw search request is base64 encoded and placed in the .entity[query].query element. The base64 encoding of the raw search request enables preserving exactly what was requested, including possibly malicious patterns. This enables detection of malicious or malformed requests.
  - The cleaned search may be recorded (not base64) in the .entity[query].description. The cleaned search request would have removed parameters that were not understood/supported. The cleaned search request in the .description element enables more efficient processing.

Note: the pattern defined in DICOM and IHE have the client is identified as the Source Role ID, and the server is identified as the Destination Role ID. This represents the query parameters are flowing from the client to the server. This may not be so obvious, as the data actually flows the opposite direction. This pattern is established and thus followed here.
"""
* code = http://terminology.hl7.org/CodeSystem/audit-event-type#rest // "Restful Operation"
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open // allow other codes
* category 1..
* category contains anySearch 1..1
* category[anySearch] from AllSearchVS (required)
* action = #E
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
* agent[client].type = http://dicom.nema.org/resources/ontology/DCM#110153 // "Source Role ID"
* agent[client].type 1..1
* agent[client].who 1..1 // client identifier, May be an Device Resource, but more likely an identifier given the App identified in the OAuth token 
* agent[client].network[x] 1..1 // as known by TCP connection information
* agent[server].type = http://dicom.nema.org/resources/ontology/DCM#110152 // "Destination Role ID"
* agent[server].type 1..1
* agent[server].who 1..1 // server identifier. May be a Device Resource, but likely just an identifier of the domain name
* agent[server].network[x] 1..1 // as known by TCP connection information
* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP // "information recipient"
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
    query 1..1
* entity[transaction].role = BasicAuditEntityType#XrequestId
* entity[transaction].what.identifier.value 1..1
* entity[transaction].what.identifier.value ^short = "the value of X-Request-Id"
* entity[query].role = http://terminology.hl7.org/CodeSystem/object-role#24 // "Query"
* entity[query].what 0..0
* entity[query].securityLabel ^short = "may contain the security labels on the Bundle search set returned"
* entity[query].query 1..1

////////////////////////////////////////////////////////////// Patient Query Profile ////////////////////////
Profile:        PatientQuery
Parent:         Query
Id:             IHE.BasicAudit.MHD5.PatientQuery
Title:          "Basic AuditEvent for a successful Query with Patient"
Description:    """
A basic AuditEvent profile for when a RESTful Query action happens successfully, and where there is an identifiable Patient subject associated with the read Resource(s).

- Given a RESTful Query is requested
- And the request is for a Patient subject indicated
  - The requestor includes a Patient id or identifier as a query parameter
  - The requestor security context is limited to a given Patient identity
- And the request is authorized
  - Authorization failures should follow [FHIR core Access Denied](http://hl7.org/fhir/security.html#AccessDenied)
- When successful
  - Note a failure AuditEvent may follow this pattern, but would not be a successful outcome and should have an OperationOutcome
  - Note success may result in zero or more results. The number of results and the content of the results are not recorded.
- Then the AuditEvent recorded will conform
  - The raw search request is base64 encoded and placed in the .entity[query].query element. The base64 encoding of the raw search request enables preserving exactly what was requested, including possibly malicious patterns. This enables detection of malicious or malformed requests.
  - The cleaned search may be recorded (not base64) in the .entity[query].description. The cleaned search request would have removed parameters that were not understood/supported. The cleaned search request in the .description element enables more efficient processing.
- And When multiple patient results are returned, one AuditEvent is created for every Patient identified in the resulting search set. Note this is true when the search set bundle includes any number of resources that collectively reference multiple Patients. This includes one Resource with multiple subject values, or many Resources with single subject values that are different.

Note: the pattern defined in DICOM and IHE have that the client is identified as the Source Role ID, and the server is identified as the Destination Role ID. This may not be so obvious, as the data actually flows the opposite direction. This pattern is established and thus followed here.
"""
//* entity ^slicing.discriminator.type = #value
//* entity ^slicing.discriminator.path = "type"
//* entity ^slicing.rules = #open
* entity 1..
* entity contains 
    patient 1..1 
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 // "Patient"
* entity[patient].what 1..1
* entity[patient].what only Reference(Patient)


