# ITI.MHD 
this GITHUB repository is under development by ITI Technical committee. 

The Mobile access to Health Documents (MHD) Profile defines one standardized interface to 
health documents (a.k.a., an Application Programming Interface (API)) for use by mobile devices 
so that deployment of mobile applications is more consistent and reusable. 
The transactions defined here leverage the document content- and format-agnostic metadata concepts 
from XDS but simplify them for access in constrained environments including mobile devices. 

This IG has changed from the use of DocumentManifest Resource to use of the List Resource for both SubmissionSet and Folder.
 
The IHE MHD Profile text is Normative, this IG publication is Informative. 
After public comment resolution this Implementation Guide will become the normative specification for MHD.

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
1. get the DependsOn on FormatCode IG working (suspect the formatcode IG is not fully registered, asked Grahame for help)
1. make all fhir http references into proper markdown URL
1. Given the breaking change (DocumentManifest -> List) should this be versioned as 4.0
1. Define Must-Support, should this be in appendix Z
1. should we have a link from one page to the next? If so, what does that look like? (Check with Lloyd and Jose, there is possibly something already in the works)
1. add figure / table numbers as if they are in the right header number space
1. Write up an open issue explaining header numbers are not aligned with their eventual locations in volume 1 and 2
1. capability statements to new List use away from DocumentManifest 
1. various other TODO tags found in the source input
1. clean as many build warnings as possible
1. Open Issue: should the text against the MHD profile found in the IUA supplement be brought into the MHD IG? Seems the reader would benefit.
1. Create residual open issues, and create a summary of changes since 3.2

## TODO

none


### Examples
1. Need to figure out how to get a Sushi Bundle with a Binary attached to a DocumentReference.content.attachment.url
1. Add narrative to the examples. Some examples are intended to show edge cases that are not going to be valid.
1. Add examples from US-Core, or elsewhere?
1. bring in the test scripts from Bill's test infrastructure
1. Full complement of Provide bundle examples
  1. example needed - add a new document to a existing Folder
  1. example needed - add a existing document to an existing Folder
  1. example needed - a new submission set to include existing document
  1. example not needed - a new submission set to include existing document from a different patient (mother / child use-case)
  1. example needed - replace a document
  1. example needed - push to a recipient
1. Example of an Provide bundle response


## IHE issues

1. canonical url -- should we include realm in the URI like hl7?
1. why do we need to add .fhir at the end of all profile id?

## Test

Note that these conformance resources are NOT the ones used by Bill's test tools for USA Connectathon. The conformance resources here have been modified to fit the rules of the IG build tooling. The change is to the filename, name, and id. These differences are unfortunate. Most importantly is the canonical URI of each structure definition is a different value.

Bills test tooling for MHD at IHE Connectathon in USA in January
    https://github.com/usnistgov/asbestos
