<div markdown="1" class="stu-note">

This Test Plan page is a prototype.   We expect the maturity of the content will improve over time.  For now, we summarize high level testing scope and available tools. Comments are welcome.
</div>

## Introduction

MHD is an API between four actors.  The transactions between actors specify semantics of the data exchanged.  The MHD test plan focuses on these semantics and on the expected actions on the server-side actors (Document Recipient and Document Responder).

The overall scope of MHD testing is affected by the infrastructure that MHD is connected to. For example, where the Document Responder and Document Recipient are grouped with XDS or MHDS infrastructure, more tests apply.

MHD does not mandate of the functionality to be provided by the data communicated via MHD transations. How MHD actors use the data communicated via these transaction is out-of-scope for MHD testing, but may apply to other related Implementation Guides or IHE Profiles.

## High-level Test Scope

### ITI-65 Provide Document Bundle

* Document Source publishes document and folder combinations
  * Note that the Document Content is not material to these tests. It could be a simple text file, CDA, FHIR-Document, PNG image, DICOM KOS, or anything that has a mime type
* Document Recipient receives and responds as appropriate 
  * Document Recipient may have policy against some content types.

### ITI-66 Find Document Lists, ITI-67 Find Document References, ITI-68 Retrieve Document

* Document Consumer requests query for List (Submission Set & Folder), query for DocumentReference, and retrieve document
* Document Responder responds to query and retrieve as appropriate

### Options

* "Comprehensive Metadata" for the Document Source & Document Recipient
* "XDS on FHIR" for the Document Recipient and Document Responder (i.e. XDS backend for server actors)
* "Uncontained Reference" for all MHD actors

## Unit Test Procedure (Conformance Testing)

Unit testing this context entails testing a SUT with a simulator or validator tool.  A simulator is a implementation of an actor that is designed specifically to test the opposite pair actor. The simulator might be a reference implementation or may be a specially designed test-bench.  Often, when a reference implementation is used, the negative tests are harder to simulate. A validator is a implementation that can check conformance. A validator may be a simulator, but may also be a standalone tool used to validate only a message encoding. Some reference implementations may be able to validate to a StructureDefinition profile, but often these do not include sufficient constraints given the overall actor conformance criteria. 

### Available tools for MHD unit testing

#### FHIR Toolkit (aka "Asbestos") - Simulator and Validator

* Provider: NIST (US National Institute of Standards and Technology)
* FHIR Toolkit online: https://tools.iheusa.org:9743/home
* Tool distribution: https://github.com/usnistgov/asbestos/releases/
  * Release 2.x.x is compatible with MHD version 3.x.
  * As of June 2021, FHIR Toolkit is not compatible with MHD version 4.x.
  * Features may be added to FHIR Toolkit in subsequent releases. Check release notes in the tool distribution link above.
* Documentation (installation):  https://github.com/usnistgov/asbestos/wiki/xInstallation-Guide-v2.x.x
* Tool support: http://groups.google.com/group/ihe-mhd-implementors
* Actors (options) tested:  Document Source (minimal metadata), Document Source (comprehensive metadata), Document Source (minimal metadata), Document Source (comprehensive metadata)
* Other notes:  

#### Gazelle External Validation Service (aka "EVS Client") - Validator

* Provider:  INRIA (Rennes, France), KEREVAL (https://www.kereval.com/), and Mallinckrodt Institute of Radiology (Saint Louis, USA) 
* Tool location: https://gazelle.ihe.net/EVSClient/home.seam
* Documentation: https://gazelle.ihe.net/content/evsfhirvalidation
* Scope of testing: validation of FHIR Resources using StructureDefinitions for MHD
* Other notes: StructureDefinitions available in EVSClient validation are published by IHE here: https://github.com/IHE/fhir/tree/master/StructureDefinition

## Integration Test Procedure (Interoperability Testing)

Integration Testing in this context is where two SUT of paired actors test against each other.  Integration testing is often limited by the capability of the client (Document Source or Document Consumer), which may support only a subset of the semantics required to be supported by the server (Document Recipient or Document Responder).  Full message semantics and failure-modes are more thoroughly exercised with unit (conformance) tests.

The tests listed below are defined in Gazelle Master Model (https://gazelle.ihe.net/GMM) and are performed by systems testing MHD at IHE Connectathons.

### Document Source --> Document Recipient Interoperability Tests

* MHD_Create_ITI-65
* MHD_Create_with_List
* MHD_Submit_XDSonFHIR
* MHD_XDSonFHIR_Replace
* MHD_XDSonFHIR_Append
* MHD_XDSonFHIR_Transform

### Document Consumer --> Document Responder Interoperability Tests

* MHD_Search_ITI-66
* MHD_SearchRead_ITI-67_ITI-68
* MHD_QryRetr_XDSonFHIR
