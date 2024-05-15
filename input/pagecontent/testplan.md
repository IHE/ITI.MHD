<div markdown="1" class="stu-note">

We expect the maturity of testing will improve over time independent of the versions of MHD.

This page was last updated May 2024.
</div>

## Introduction

MHD is an API between four actors. The transactions between actors specify semantics of the data exchanged.  The MHD test plan focuses on these semantics and on the expected actions on the server-side actors (Document Recipient and Document Responder).

The overall scope of MHD testing is affected by the infrastructure that MHD is connected to. For example, where the Document Responder and Document Recipient are grouped with XDS or MHDS infrastructure, more tests apply.

MHD does not mandate the functionality to be provided by the data communicated via MHD transactions. How MHD actors use the data communicated via these transaction is out-of-scope for MHD testing, but may apply to other related Implementation Guides or IHE Profiles.

## High-level Test Scope

### Submit [ITI-65], [ITI-105], and [ITI-106]

- Document Source publishes document and folder combinations
  - Note that the Document Content is not material to these tests. It could be a simple text file, CDA, FHIR-Document, PNG image, DICOM KOS, or anything that has a mime type
- Document Recipient receives and responds as appropriate 
  - Document Recipient may have policy against some content types.

### [ITI-66] Find Document Lists, [ITI-67] Find Document References, [ITI-68] Retrieve Document

- Document Consumer requests query for List (Submission Set & Folder), query for DocumentReference, and retrieve document
- Document Responder responds to query and retrieve as appropriate

## Unit Test Procedure (Conformance Testing)

Unit testing this context entails testing a SUT with a simulator or validator tool.  A simulator is a implementation of an actor that is designed specifically to test the opposite pair actor. The simulator might be a reference implementation or may be a specially designed test-bench.  Often, when a reference implementation is used, the negative tests are harder to simulate. A validator is a implementation that can check conformance. A validator may be a simulator, but may also be a standalone tool used to validate only a message encoding. Some reference implementations may be able to validate to a StructureDefinition profile, but often these do not include sufficient constraints given the overall actor conformance criteria. 

### Available Tools for MHD Unit Testing

#### FHIR Toolkit (aka "Asbestos") - Simulator and Validator

- Provider: NIST (US National Institute of Standards and Technology)
- FHIR Toolkit online status: https://github.com/usnistgov/asbestos/wiki/Online-tool-availability-status
- Tool distribution: https://github.com/usnistgov/asbestos/releases/
  - Release 4.x.x is compatible with IHE MHD version 3.x and 4.0.1
  - Features may be added to FHIR Toolkit in subsequent releases. Check release notes in the tool distribution link above
- Documentation (installation):  https://github.com/usnistgov/asbestos/wiki/Installation-Guide
- Tool support: http://groups.google.com/group/ihe-mhd-implementors
- Actors (options) tested:  Document Source (minimal metadata), Document Source (comprehensive metadata), Document Source (minimal metadata), Document Source (comprehensive metadata)
- Other notes:  

#### Gazelle External Validation Service (aka "EVS Client") - Validator

- Provider:  INRIA (Rennes, France), KEREVAL (https://www.kereval.com/), and Mallinckrodt Institute of Radiology (Saint Louis, USA) 
- Tool location: https://gazelle.ihe.net/EVSClient/home.seam
- Documentation: https://gazelle.ihe.net/content/evsfhirvalidation
- Scope of testing: validation of FHIR Resources using StructureDefinitions for MHD
- Other notes: StructureDefinitions available in EVSClient validation are published by IHE here: https://github.com/IHE/fhir/tree/master/StructureDefinition

## Integration Test Procedure (Interoperability Testing)

Integration Testing in this context is where two SUT of paired actors test against each other.  Integration testing is often limited by the capability of the client (Document Source or Document Consumer), which may support only a subset of the semantics required to be supported by the server (Document Recipient or Document Responder).  Full message semantics and failure-modes are more thoroughly exercised with unit (conformance) tests.

The tests listed below are defined in Gazelle Master Model (https://gazelle.ihe.net/GMM) and are performed by systems testing MHD at IHE Connectathons. Note the following links into the Gazelle Master Model do require a account to view.

- [Capability Statement Checks](https://gazelle.ihe.net/GMM/test.seam?id=13700)
  
### Document Source --> Document Recipient Interoperability Tests

- [Setup proxy tools](https://gazelle.ihe.net/GMM/test.seam?id=13690)
- Document Recipient without **Comprehensive Metadata Option** - [MHD_11_Toolkit_RecipMinimal](https://gazelle.ihe.net/GMM/test.seam?id=13691)
  - Should be Document Recipient declaring **UnContained Option** can handle it.
- Document Recipient with **Comprehensive Metadata Option** - [MHD_12_Toolkit_RecipComprehensiv](https://gazelle.ihe.net/GMM/test.seam?id=13692)
- [MHD_22_ProvideDocBundle_ITI-65](https://gazelle.ihe.net/GMM/test.seam?id=13427) - Testing of ITI-65
  - alternative flows for **Comprehensive Metadata Option** and **UnContained Option** and **XDS on FHIR Option**
  - alternative flows for Replace, Append, and Transform
- Document Source with **Comprehensive Metadata Option** - [MHD_13_Toolkit_SourceComprehensive](https://gazelle.ihe.net/GMM/test.seam?id=13693)
  - alternative flow for **UnContained Option**
- [MHD_22a_ITI-65_Resource_Check](https://gazelle.ihe.net/GMM/test.seam?id=13713) - AuditEvent tests
- [MHD_25_Create_with_List_Resource](https://gazelle.ihe.net/GMM/test.seam?id=13699) -- testing Folders

#### Document Recipient - XDS on FHIR Option

- [MHD_70_Submit_XDSonFHIR](https://gazelle.ihe.net/GMM/test.seam?id=13698) - basic ITI-65 test of Document Recipient declaring **XDS On FHIR Option**
- [MHD_71_XDSonFHIR_Replace](https://gazelle.ihe.net/GMM/test.seam?id=13694)
- [MHD_72_XDSonFHIR_Append](https://gazelle.ihe.net/GMM/test.seam?id=13695)
- [MHD_73_XDSonFHIR_Transform](https://gazelle.ihe.net/GMM/test.seam?id=13696)

### Document Consumer --> Document Responder Interoperability Tests

- [MHD_30a_ITI-66_Resource_Check](https://gazelle.ihe.net/GMM/test.seam?id=13709) - AuditEvent tests
- [MHD_30_FindDocumentLists_ITI-66](https://gazelle.ihe.net/GMM/test.seam?id=13727) - Test ITI-66
  - should be Document Consumer declaring **UnContained Option** can handle it.
- [MHD_30a_ITI-66_Resource_Check](https://gazelle.ihe.net/GMM/test.seam?id=13709) - AuditEvent tests
- [MHD_31a-ITI-67_Resource_Check](https://gazelle.ihe.net/GMM/test.seam?id=13711) AuditEvent tests
- [MHD_31_FindDocReferences_ITI-67](https://gazelle.ihe.net/GMM/test.seam?id=13726) - Test ITI-67
  - should be Document Consumer declaring **UnContained Option** can handle it.
- [MHD_33a-ITI-68_Resource_Check](https://gazelle.ihe.net/GMM/test.seam?id=13714) AuditEvent tests
- [MHD_32_RetrieveDocument_ITI-68](https://gazelle.ihe.net/GMM/test.seam?id=13725) - test ITI-68

#### XDS on FHIR Option

- [MHD_75_QryRetr_XDSonFHIR](https://gazelle.ihe.net/GMM/test.seam?id=13697) - The Doc Responder supports the XDS on FHIR and is grouped with an XDS Document Consumer

### Additional Tests not included in Gazelle today

- Update a Folder, where the test is focused on creating a Folder, but the ITI-65 supports updating an existing folder.
- UnContained is not tested specifically for Practitioner not being contained
- Should be tests for Replace, Transform, or Append for non XDS on FHIR situations (aka MHDS, or just push)

#### Simplified Publish Option

- no tests for this option:

#### Generate Metadata Option

- no tests for this option:

#### ITI-65 FHIR Documents Publish Option

- no tests for this option
