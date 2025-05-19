

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
The $generate-metadata Operation definition. 

This operation is needed as the $generate in FHIR R4 is not properly defined, and thus has incorrect parameters. 
The MHD $generate-metadata should be replaced when MHD is upgraded to FHIR R5. 
This MHD $generate-metadata is modeled after the expected changes in FHIR R5, and follows the example given in FHIR R4:

Input:
- the document that is either a Binary or a document Bundle
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
Generate Metadata [ITI-106](ITI-106.html) transaction Operation.
"""
* system = false
* type = true
* instance = false
* experimental = false
* affectsState = true  // as a DocumentReference may be created
* resource[0] = #DocumentReference
* inputProfile = Canonical(IHE.MHD.GenerateMetadata.Parameters.In)
* outputProfile = Canonical(IHE.MHD.GenerateMetadata.Parameters.Out)
* parameter[0].name = #document
* parameter[0].use = #in
* parameter[0].min = 1
* parameter[0].max = "1"
* parameter[0].type = #Any
* parameter[0].targetProfile[+] = Canonical(Binary)
* parameter[0].targetProfile[+] = Canonical(Bundle)
* parameter[0].documentation = "[Generate Metadata Request Message](ITI-106.html#2310641-generate-metadata-request-message)"
* parameter[1].name = #DocumentReference
* parameter[1].use = #out
* parameter[1].min = 1
* parameter[1].max = "1"
* parameter[1].type = #Reference
* parameter[1].targetProfile[+] = Canonical(DocumentReference)
* parameter[1].documentation = "[Generate Metadata Response Message](ITI-106.html#2310642-generate-metadata-response-message)"

