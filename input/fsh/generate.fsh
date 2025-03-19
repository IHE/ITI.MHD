

Profile: MHDgenerateMetadataParametersIn
Parent: Parameters
Id: IHE.MHD.GenerateMetadata.Parameters.In
Title: "IHE MHD GenerateMetadata Parameters In"
Description: "The Input Parameters for the $generate-metadata operation
- Input: binary, bundle"
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.description = "allowed parameters are binary or bundle"
* parameter ^slicing.rules = #closed
* parameter 1..1
* parameter contains
    document 1..1
* parameter[document] ^short = "document"
* parameter[document].name = "document" (exactly)
* parameter[document].value[x] 0..0
* parameter[document].resource 1..1
* parameter[document].resource only Binary or Bundle

Profile: MHDgenerateMetadataParametersOut
Parent: Parameters
Id: IHE.MHD.GenerateMetadata.Parameters.Out
Title: "IHE MHD GenerateMetadata Parameters Out"
Description: "The Output Parameters for the $generate-metadata operation
- Output: DocumentReference reference"
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.description = "DocumentReference reference"
* parameter ^slicing.rules = #closed
* parameter 1..1
* parameter contains
    docRef 1..1
* parameter[docRef] ^short = "DocumentReference created"
* parameter[docRef].name = "DocumentReference" (exactly)
* parameter[docRef].value[x] 1..1
* parameter[docRef].value[x] only Reference
* parameter[docRef].valueReference only Reference(DocumentReference)



Instance: ex-input-binary
InstanceOf: MHDgenerateMetadataParametersIn
Description: "example Parameters with a binary"
Usage: #example
* parameter[document].name = "document"
* parameter[document].resource = aaaaaaaa-bbbb-cccc-dddd-e00111100003

Instance: ex-out
InstanceOf: MHDgenerateMetadataParametersOut
Description: "example output from GenerateMetadata"
Usage: #example
* parameter[docRef].name = "DocumentReference"
* parameter[docRef].valueReference = Reference(ex-DocumentReferenceMinimal)

// TODO: example with a Document Bundle

Instance: generate-metadata
InstanceOf: OperationDefinition
Description: """
The $generate-metadata Operation defintion. 

This operation is needed as the $generate in FHIR R4 is not properly defined, and thus has incorrect parameters. 
The MHD $generate-metadata should be replaced when MHD is upgraded to FHIR R5. 
This MHD $generate-metadata is modeled after the expected changes in FHIR R5, and follows the example given in FHIR R4:

Input:
- Binary 0..1 the *document* in Binary Resource format. Usually used with CDA documents.
- Bundle 0..1 the *document* in FHIR-Document form of a Bundle of kind Document
Output:
- reference to a DocumentReference with metadata generated from the *document*
"""
Usage: #definition
* url = "https://profiles.ihe.net/ITI/MHD/OperationDefinition/generate-metadata"
* name = "GenerateMetadata"
* code = #generate-metadata
* status = #active
* kind = #operation
* publisher = "Integrating the Healthcare Enterprise (IHE)"
* title = "Generate a DocumentReference from a document"
* description = """
A client can ask a server to generate a documentReference from a document.
The server reads the existing document and generates a matching DocumentReference resource, or returns one it has previously generated. 
The server will persist the document and the DocumentReference; and may propagate based on grouping with other Actors.
Servers may be able to return or generate document references for the following types of content:
- CDA
- FHIR Document
"""
* system = false
* type = true
* instance = false
* experimental = false
* affectsState = true  // as a DocumentReference may be created
* resource[0] = #DocumentReference
* inputProfile = Canonical(IHE.MHD.GenerateMetadata.Parameters.In)
* outputProfile = Canonical(IHE.MHD.GenerateMetadata.Parameters.Out)