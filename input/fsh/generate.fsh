
Instance: MHDgenerateMetadata
InstanceOf: OperationDefinition
Description: """
The $generateMetadata Operation defintion. 

This operation is needed as the $generate in FHIR R4 is not properly defined, and thus has incorrect parameters. 
The MHD $generateMetadata should be replaced when MHD is upgraded to FHIR R5. 
This MHD $generateMetadata is modeled after the expected changes in FHIR R5, and follows the example given in FHIR R4:

Input:
- url 1..1 url to the *document*
  - note url may be a simple url, but may also be a Resource Reference (reference.reference) to a Binary, Document Bundle, or Composition
- persist 0..1 boolean when true the *document* will be persisted on a server somewhere
Output:
- reference to a DocumentReference with metadata generated from the *document*
"""
Usage: #definition
* url = "https://profiles.ihe.net/ITI/MHD/OperationDefinition/MHDgenerateMetadata"
* name = "GenerateMetadata"
* code = #generatemetadata
* status = #active
* kind = #operation
* publisher = "Integrating the Healthcare Enterprise (IHE)"
* title = "Generate a DocumentReference from a document"
* description = """
A client can ask a server to generate a documentReference from a document.
The server reads the existing document and generates a matching DocumentReference resource, or returns one it has previously generated. 
The client indicates *persist* request to persist the document. With the *persist* parameter, this is similar result to the MHD Simplified Publish.
Servers may be able to return or generate document references for the following types of content:
- CDA
- FHIR Document
- Composition
"""

* system = false
* type = true
* instance = false
* experimental = false
* affectsState = true  // as a DocumentReference may be created
* resource[0] = #DocumentReference
// TODO should there be profiles for the parameters? inputProfile and outputProfile. PIXm did that, but the $generate operation did not.
* parameter[+].name = #url
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = """
the document must be provided. The URL points at where the document is. The format may be CDA, FHIR Document Bundle, or FHIR Composistion.
"""
* parameter[=].type = #uri
* parameter[+].name = #persist
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = """
Whether to store the document at the document end-point (/Document) or not, once it is generated (default is for the server to decide).
"""
* parameter[=].type = #boolean
* parameter[+].name = #docRef
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = """
The server either returns a single documentReference, or it returns an error. 
If the input url refers to another server, it is at the discretion of the server whether to retrieve it or return an error.
"""
* parameter[=].type = #DocumentReference
