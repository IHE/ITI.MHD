# ITI.MHD
ImplementationGuide for IHE IT Infrastructure Technical Framework Supplement http://wiki.ihe.net/index.php/Mobile_access_to_Health_Documents_(MHD) Mobile access to Health Documents (MHD) Rev. 3.1.
 
The IHE MHD Profile text is Normative, this IG publication is Informative.

This Continuous Build will appear http://build.fhir.org/ig/IHE/ITI.MHD/branches/master/index.html

<<<<<<< HEAD
## Done

1. Import all conformance resources and correct as needed
1. filenames must go back to using period not underbar
1. canonical must go back to using period not underbar
1. Added examples (Bill, Oliver, US-Core)
1. update to IHE template

## TODO

1. Add narrative for volume 1
1. Add narrative for volume 2 (within the structure definitions)
1. add ATNA mapping? or profile? or example?
=======
Note that these conformance resources are NOT the ones used by Bill's test tools for USA Connectathon. The conformance resources here have been modified to fit the rules of the IG build tooling. The change is to the filename, name, and id. These differences are unfortunate. Most importantly is the canonical URI of each structure definition is a different value.

Bills test tooling for MHD at IHE Connectathon in USA in January
    https://github.com/usnistgov/asbestos
    
Done
1. Import all conformance resources and correct as needed
1. filenames must go back to using period not underbar
1. canonical must go back to using period not underbar
1. some examples from Bill's test bench, and from Oliver. 
1. published using the IHE template

TODO
1. Add narrative body from volume 1
1. Add narrative to the conformance resources
1. Add narrative to the examples
1. Add examples from US-Core, or elsewhere?
1. add ATNA mapping? or profile? or example? or just point at Gazelle? or get FHIR structureDefinitions from Gazelle?
>>>>>>> c77a90ed5553179f7d2136297a22aeec9a8243c5
1. make sure there is a page for security, privacy, provenance, safety, error handling, dependency, 
1. bring in the test scripts from Bill's test infrastructure

## IHE issues

1. canonical url -- should we include realm in the URI like hl7?
1. why do we need to add .fhir at the end of all profile id?
1. need template git repository with layout for IHE --- reflect the current supplement template in sample-ig

## Test

The test tools that Bill has published use the more formal documented structure definitions. Given that the conformance resources are informative, this deviation is expected and part of the evolution. The stucture definitions within ITI.MHD have been updated to better fit into the IG publication tooling.

https://github.com/usnistgov/asbestos/releases/tag/v1.0.0
