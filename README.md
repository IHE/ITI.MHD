
# ITI.MHD 
This GITHUB repository is the source content for the [MHD publication](https://profiles.ihe.net/ITI/MHD/) by ITI Technical committee. 

The Mobile access to Health Documents (MHD) Profile defines one standardized interface to 
health documents (a.k.a., an Application Programming Interface (API)) for use by mobile devices 
so that deployment of mobile applications is more consistent and reusable. 
The transactions defined here leverage the document content- and format-agnostic metadata concepts 
from XDS but simplify them for access in constrained environments including mobile devices. 

This Continuous Build will appear http://build.fhir.org/ig/IHE/ITI.MHD/branches/master/index.html

Formal Publication at http://profiles.ihe.net/ITI/MHD

History of publications at https://profiles.ihe.net/ITI/MHD/history.html 

# Master - 4.1.x

The master branch, version 4.1.x, holds technical corrections independent of the Improvements 2022

# Improvements 2022 - 4.2.x

This branch is dedicated to the improvements agreed to for 2022 Fall Quarter as version 4.2.0 :

- Explain when including Patient in the Bundle is acceptable - [#89](https://github.com/IHE/ITI.MHD/issues/89)
- Constraints on Identifier - [#93](https://github.com/IHE/ITI.MHD/issues/93)
- SubmisstionSet identifier 2.. cardionality is unclear - [#92](https://github.com/IHE/ITI.MHD/issues/92)
- Allow DocumentReference.context.encounter - [#88](https://github.com/IHE/ITI.MHD/issues/88)
- Clarify replaceTo behaviour and mechanism - [#100](https://github.com/IHE/ITI.MHD/issues/100)
- Support FHIR Document Bundle as an attachment type - [#91](https://github.com/IHE/ITI.MHD/issues/91)
- Simplified publish - [#122](https://github.com/IHE/ITI.MHD/issues/122) -- Spencer
- DocumentReference $generate operation - [#123](https://github.com/IHE/ITI.MHD/issues/123)
- Align AuditEvents with BasicAudit IG
- include other fixes from master branch
    
ci-build -- http://build.fhir.org/ig/IHE/ITI.MHD/branches/Improvements-2022/index.html
