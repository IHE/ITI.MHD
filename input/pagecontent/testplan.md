The overall MHD is an API between four actors, with no expectation or mandate of the function to be provided by the data communicated. Ths the tests that can be executed are limited to the functionality of the system-under-test (SUT). Where that SUT has a function, it can be tested. 

The overall success of MHD testing is limited by the infrastructure that MHD is connected to. For example where the Document Responder and Document Recipient are grouped with XDS or MHDS infrastructure, then the Document Consumer and Document Source can be more fully tested. 

## Test Plan

The following is the overall test plan for MHD alone:
* Document Source publishes all known document and folder combinations
* Document Recipient receives and responds as appropriate
* Document Consumer requests all forms of query for Folder, query for DocumentReference, and retrieve document
* Document Resonder responds to query and retrieve as appropriate

### Document Source and Document Recipient

Given that the system that has implemented the Document Source actor may choose to implement a subset of the functionality provided by the Document Source actor, the capability of the Document Source would be able to test only that subset of the following. The Document Responder also may only support a subset of the functionality provided by the Document Responder actor (e.g. may not support Folders, or may have policy against external document content). The conformance to Minimal-Metadata vs Comphrehensive-Metadata would also vary depending on the functionality of the SUT. 

Note that the Document Content is not material to these tests. It could be a simple text file, CDA, FHIR-Document, PNG image, DICOM KOS, or anything that has a mime type. Document Recipient may have policy against some content types.

#### Positive Test Scenarios 
presumes security successful
* provide CapabilityStatement with indications of support of the MHD Document Source actor
* Where both minimal-metadata and comprehensive-metadata are supported by SUT, it would test both minimal and comprehensive to test out extremes. 
* Publish one DocumentReference with document content
* Publish one DocumentReference with external document content
* Publish two Documents with document
* Publish one Document and a Folder
* Publish two Documents and a Folder
* Publish Replacement of a Document
* Publish one Document and an update to an existing Folder 
* Publish one Document and a Transform of that Document
* Publish one Document as a Transform of an existing Document
* Publish one On-Demand Document
* Publish one Defered-Creation Document

#### Negative Test Scenarios: 
Document Responder returns failure-mode, Document Consumer handles failure gracefully
* Access control failure
* No CapabilityStatement available from Document Responder
* Minimal-Metadata when Comprehensive is required
* Hash and Size do not match the document content
* Metadata is proper, but not within configured policy (e.g. unsupported FormatCode)
* document too big
* Folder not supported
* external document not supported
* inability to store content (e.g. storage failure, or XDS return failures)


### Document Consumer and Document Responder


Given that the system-under-test that has implemented the Document Consumer actor may choose to implement a subset of the functionality provided by the Document Consumer actor


## Unit Test Procedure

Unit Tests in this context is where a SUT is tested against a simulator or validator.  A simulator is a implementation of an actor that is designed specifically to test the oposite pair actor. The simulator might be a reference implementation or may be a specially designed test-bench. Where a reference implementation is used the negative tests are harder to simulate. A validator is a implementation that can check conformance. A validator may be a simulator, but may also be a standalone tool used to validate only a message encoding. Some reference implementations may be able to validate to a StructureDefinition profile, but often these do not include sufficient constraints given the overall actor conformance criteria. 

## Integration Test Procedure

Integration Tests in this context is where two SUT of paired actors test against each other. In this case the subset of tests that can be tested is the intersection. Testing only this intersection is necessary but not sufficient. The testing must also include the capability of the client (Document Source or Document Consumer) to exercise the test scenarios that this SUT can test, to determine that failure-modes are handled properly by both SUT.

## Cucumber
TODO: Write specific Cucumber statements, might use external tooling?
