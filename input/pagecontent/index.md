
The Mobile access to Health Documents (MHD) Profile defines one standardized interface to health documents (a.k.a. an Application Programming Interface (API)) for use by mobile devices so that deployment of mobile applications is more consistent and reusable. The transactions defined here leverage the document content- and format-agnostic metadata concepts from XDS but simplify them for access in constrained environments including mobile devices. The MHD Profile does not replace XDS. Mobile devices, and other resource-constrained systems, can use MHD to access to an XDS Repository. The following figure shows one possible way to implement MHD within a document sharing environment (that may be, but is not necessarily, XDS-based). This implementation choice is not mandatory, and we recognize other architectures will be implemented. 

[Open and Closed Issues](a_issues.html)

### Organization of This Guide
This guide is organized into four main sections:

1. Volume I: [Overview](1_overview.html)
   1. [Actors and Transactions](2_actors_and_transactions.html)
   2. [Security Considerations](3_security_considerations.html)
   3. [Cross Profile Considerations](4_grouping.html)

2. Volume II: Transaction Detail
   1. [Provide Document Bundle [ITI-65]](transaction-65.html)
   2. [Find Document Lists [ITI-66]](transaction-66.html)
   3. [Find Document References [ITI-67]](transaction-67.html)
   4. [Retrieve Document [ITI-68]](transaction-68.html)

3. Volume III: Metadata
   1. [FHIR Representation](metadata_maps.html)
   
4. Appendix
	1. [E: FHIR Identifier Type for CX](appendix_e.html)
	2. [Z: FHIR Common IHE Constraints](appendix_z.html)
	3. [Test Plan](testplan.html)

Click on any of the links above, head on over the [table of contents](toc.html), or
if you are looking for a specific artifact, check out the [index](artifacts.html).

You can also download:

* [this entire guide](full-ig.zip),
* the definition resources in [json](definitions.json.zip), [xml](definitions.xml.zip), [ttl](definitions.ttl.zip), or [csv](csvs.zip) format, or
* the example resources in [json](examples.json.zip), [xml](examples.xml.zip) or [ttl](examples.ttl.zip) format.

The source code for this Implementation Guide can be found on
[https://github/JohnMoehrke/MHD-fsh](https://github.com/JohnMoehrke/MHD-fsh).

