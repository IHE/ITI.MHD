# ITI.MHD
ImplementationGuide for IHE IT Infrastructure Technical Framework Supplement http://wiki.ihe.net/index.php/Mobile_access_to_Health_Documents_(MHD) Mobile access to Health Documents (MHD) Rev. 3.1.
 
The IHE MHD Profile text is Normative, this IG publication is Informative.

This Continuous Build will appear http://build.fhir.org/ig/IHE/ITI.MHD/branches/master/index.html

## Done

1. Import all conformance resources and correct as needed
1. filenames must go back to using period not underbar
1. canonical must go back to using period not underbar
1. some examples from Bill's test bench, and from Oliver. 
1. published using the IHE template

## TODO
1. Add narrative body from volume 1
1. Add narrative to the conformance resources
1. Add narrative to the examples
1. Add examples from US-Core, or elsewhere?
1. add ATNA mapping? or profile? or example? or just point at Gazelle? or get FHIR structureDefinitions from Gazelle?
1. make sure there is a page for security, privacy, provenance, safety, error handling, dependency, 
1. bring in the test scripts from Bill's test infrastructure
1. get the DependsOn on FormatCode IG working
1. The profiling of a Bundle seems to not be the same as for Resources. Thus I have added a more simple bundle "degenerate". This is not enforcing the full MHD Provide transaction requirements.

## IHE issues

1. canonical url -- should we include realm in the URI like hl7?
1. why do we need to add .fhir at the end of all profile id?
1. need template git repository with layout for IHE --- reflect the current supplement template in sample-ig

## Test

Note that these conformance resources are NOT the ones used by Bill's test tools for USA Connectathon. The conformance resources here have been modified to fit the rules of the IG build tooling. The change is to the filename, name, and id. These differences are unfortunate. Most importantly is the canonical URI of each structure definition is a different value.

Bills test tooling for MHD at IHE Connectathon in USA in January
    https://github.com/usnistgov/asbestos
