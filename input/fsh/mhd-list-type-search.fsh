//TODO
Instance: List-DesignationType
InstanceOf: SearchParameter
Title: "search on the IHE defined extension for designationType"
* url = "http://ihe.net/fhir/ihe.mhd.fhir/SearchParameter/List-DesignationType"
* description = "This SearchParameter enables finding Lists by the designationType of code submissionSet or folder.."
* name = "designationType"
* status = #active
* code = #designationType
* base = #List
* expression = "extension(DesignationType).valueCodeableConcept"
* type = #token


