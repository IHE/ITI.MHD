Profile:        MhdList
Parent:         List
Id:             IHE.MHD.List
Title:          "MHD common List with designationType"
Description:    "A profile on the List resource for MHD. Used with both Folder and SubmissionSet.
- MHD adds a codeable Concept to List for use with Folder and SubmissionSet"
* extension contains DesignationType named designationType 0..*
* modifierExtension 0..0
// code is used ONLY to switch between folder and submissionSet
* identifier 0..* 
* code 1..1
* code from MHDlistTypesVS (required)

Extension: DesignationType
Id: ihe-designationType
Title: "Clinical code of the List"
Description: "Expresses contentType of submissionSet or the codeList of a Folder. Usually expressed in LOINC or SNOMED."
* ^context[+].type = #element
* ^context[=].expression = "List"
* value[x] only CodeableConcept
* valueCodeableConcept 1..1

Instance: List-DesignationType
InstanceOf: SearchParameter
Title: "search on the IHE defined extension for designationType"
Usage: #definition
* url = "https://profiles.ihe.net/ITI/MHD/SearchParameter/List-DesignationType"
* description = "This SearchParameter enables finding Lists by the designationType code in a submissionSet or folder."
* name = "DesignationType"
* status = #active
* code = #designationType
* base = #List
* expression = "(extension('https://profiles.ihe.net/ITI/MHD/StructureDefinition/ihe-designationType').value.ofType(CodeableConcept))"
* type = #token

CodeSystem:  MHDlistTypes 
Title: "MHD List Types"
Description:  "To use the List resource for two different use-cases we define a code-system with the types of List needed in MHD"
* ^caseSensitive = true
* ^experimental = false
* #folder "Folder as a FHIR List"
* #submissionset "SubmissionSet as a FHIR List"

ValueSet: MHDlistTypesVS
Title: "MHD List Types ValueSet"
Description: "ValueSet of the MHD List Types allowed"
* ^experimental = false
* MHDlistTypes#folder
* MHDlistTypes#submissionset


