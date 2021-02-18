Profile:        MhdList
Parent:         List
Id:             IHE.MHD.List
Title:          "MHD common List with designationType"
Description:    "A profile on the List resource for MHD. Used with both Folder and SubmissionSet.
* MHD adds a codeable Concept to List for use with Folder and SubmissionSet
"
* extension contains DesignationType named designationType 0..*
// code is used ONLY to switch between folder and submissionSet
* code 1..1 
* code from MHDlistTypesVS

Extension: DesignationType
Id: ihe-designationType
Title: "Clinical code of the List"
Description: "Expresses contentType of submissionSet or the codeList of a Folder. Usually expressed in LOINC or SNOMED."
* value[x] only CodeableConcept


Instance: List-DesignationType
InstanceOf: SearchParameter
Title: "search on the IHE defined extension for designationType"
* url = "http://ihe.net/fhir/ihe.mhd.fhir/SearchParameter/List-DesignationType"
* description = "This SearchParameter enables finding Lists by the designationType code in a submissionSet or folder."
* name = "DesignationType"
* status = #active
* code = #designationType
* base = #List
* expression = "(extension('http://ihe.net/fhir/ihe.mhd.fhir/StructureDefinition/DesignationType').value as CodeableConcept)"
* type = #token

CodeSystem:  MHDlistTypes 
Title: "MHD List Types"
Description:  "To use the List resource for two different use-cases we define a code-system with the types of List needed in MHD"
* #folder "Folder as a FHIR List"
* #submissionset "SubmissionSet as a FHIR List"

ValueSet: MHDlistTypesVS
* MHDlistTypes#folder
* MHDlistTypes#submissionset


