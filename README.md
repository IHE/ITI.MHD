# ITI.MHD 
this GITHUB repository is under development by ITI Technical committee. 

ImplementationGuide for IHE IT Infrastructure Technical Framework Supplement http://wiki.ihe.net/index.php/Mobile_access_to_Health_Documents_(MHD) Mobile access to Health Documents (MHD) Rev. 3.2.

This IG has converted from DocumentManifest to use of List for both SubmissionSet and Folder
 
The IHE MHD Profile text is Normative, this IG publication is Informative.

This Continuous Build will appear http://build.fhir.org/ig/IHE/ITI.MHD/branches/master/index.html

## Done

1. Import all conformance resources and correct as needed
1. filenames must go back to using period not underbar
1. canonical must go back to using period not underbar
1. some examples from Bill's test bench, and from Oliver. 
1. published using the IHE template
1. Add narrative body from volume 1
1. Update text from version 3.1 of MHD to version 3.2
1. Added an extension to support SubmissionSet sourceId as List.source does not allow Organization (or RelatedPerson) https://jira.hl7.org/browse/FHIR-30154
1. Add Mapping and Confirm cardinality and MS support for Folder and SubmissionSet
1. Add mapping and confirm cardinality and MS support for DocumentReference
1. Create DocumentReference examples covering all profiles
1. create profiles and simple examples for all AuditEvents 
1. Finish the audit events for Find Lists, Find Documents, and Retrieve Document
1. Finish profile for Provide Document Bundles
1. Add an example of a minimal Document Bundle
1. Convert Folder and SubmissionSet narrative to the use of List. Narrative today is mostly right out of existing MHD and thus uses DocumentManifest.
1. make hotlinks as appropriate out of all references to Technical Framework profiles.ihe.net
1. Add query parameter for ihe type 
1. example of a GET request that uses the extended query parameter

## TODO
1. Add narrative to the conformance resources -- note conformance resource is not supported in FSH, and the FSH complier required JSON disallowing XML conformance resource. 
1. Add narrative to the examples
1. Add examples from US-Core, or elsewhere?
1. bring in the test scripts from Bill's test infrastructure
1. get the DependsOn on FormatCode IG working (suspect the formatcode IG is not fully registered, asked Grahame for help)
1. Full complement of Provide bundle examples
1. various other TODO tags found in the source input
1. cleanup all build warnings and info (moving to ignore warnings anything that is proven to be acceptable)
1. capability statements to new List use away from DocumentManifest 
1. Define Must-Support, should this be in appendix Z
1. make all fhir http references into proper markdown URL
1. add to vol3 content a mapping between XDS https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.4.1 and FHIR OperationOutcome. 
1. example needed - add a new document to a existing Folder
1. example needed - add a existing document to an existing Folder
1. example needed - a new submission set to include existing document
1. example not needed - a new submission set to include existing document from a different patient (mother / child use-case)
1. example needed - replace a document
1. example needed - push to a recipient

## IHE issues

1. canonical url -- should we include realm in the URI like hl7?
1. why do we need to add .fhir at the end of all profile id?
1. handle persistent section numbers and references. Today I left in original numbers most of the time. Today I only changed a few to markdown links for experimentation.

## Test

Note that these conformance resources are NOT the ones used by Bill's test tools for USA Connectathon. The conformance resources here have been modified to fit the rules of the IG build tooling. The change is to the filename, name, and id. These differences are unfortunate. Most importantly is the canonical URI of each structure definition is a different value.

Bills test tooling for MHD at IHE Connectathon in USA in January
    https://github.com/usnistgov/asbestos
