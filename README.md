# Improvements 2022

This branch is dedicated to the improvements agreed to for 2022 Spring Quarter:

simple to write
- Explain when including Patient in the Bundle is acceptable - [#89](https://github.com/IHE/ITI.MHD/issues/89)
- Constraints on Identifier - [#93](https://github.com/IHE/ITI.MHD/issues/93)
- SubmisstionSet identifier 2.. cardionality is unclear - [#92](https://github.com/IHE/ITI.MHD/issues/92)
- Allow DocumentReference.context.encounter - [#88](https://github.com/IHE/ITI.MHD/issues/88)

harder to write
- Clarify replaceTo behaviour and mechanism - [#100](https://github.com/IHE/ITI.MHD/issues/100)
- Support Bundle as an attachment type - [#91](https://github.com/IHE/ITI.MHD/issues/91)
- Alignment with $docref operation - [#109](https://github.com/IHE/ITI.MHD/issues/109)
- other?

stretch goal (not originally agreed to, but could be included if achieved in the timeframe)
- Simplified publish - [#122](https://github.com/IHE/ITI.MHD/issues/122) -- Spencer
- DocumentReference $generate operation -- [#123](https://github.com/IHE/ITI.MHD/issues/123)

ci-build -- http://build.fhir.org/ig/IHE/ITI.MHD/branches/Improvements-2022/index.html

# ITI.MHD 
This GITHUB repository is the source content for the [MHD publication](https://profiles.ihe.net/ITI/MHD/) by ITI Technical committee. 

The Mobile access to Health Documents (MHD) Profile defines one standardized interface to 
health documents (a.k.a., an Application Programming Interface (API)) for use by mobile devices 
so that deployment of mobile applications is more consistent and reusable. 
The transactions defined here leverage the document content- and format-agnostic metadata concepts 
from XDS but simplify them for access in constrained environments including mobile devices. 

This IG has changed from the use of DocumentManifest Resource to use of the List Resource for both SubmissionSet and Folder.
 
This Continuous Build will appear http://build.fhir.org/ig/IHE/ITI.MHD/branches/master/index.html

Formal Publication at http://profiles.ihe.net/ITI/MHD

