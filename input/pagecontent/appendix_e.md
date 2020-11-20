## Appendix E Usage of the CX Data Type in PID-3 Patient Identifier List

EDITOR: Add the following new section to the end of ITI TF-2x: Appendix E Usage of the CX Data Type in PID-3 Patient Identifier List

### FHIR Identifier Type

The HL7 FHIR standard uses the data type Identifier to express a business identifier that uniquely identifies a thing or object (see FHIR http://hl7.org/fhir/R4/datatypes.html#identifier) including medical record numbers or patient identifiers. See Appendix Z.9.1 for general guidance on FHIR Identifier datatype. This concept is different than the resource identifier, known as “logical id” or “id” in FHIR, which identifies a resource. (A resource identifier may also be represented as an Identifier instance however.) 

This section specifies how IHE profiles use the Identifier data type in FHIR resources. 

IHE adds constraints to the Identifier data type; requirements for populating its elements vary slightly depending on what actor is originating a transaction. 

The FHIR Identifier type introduces a different mechanism for conveying the originating system of a particular identifier. Whereas HL7 Version 2 and Version 3 messages identify an assigning organization as an HD (Hierarchical Descriptor) or an OID in the “root” attribute, respectively, HL7 FHIR requires the use of a URI. This may necessitate some configuration on the part of actors in IHE profiles to correctly map between a URI and an OID, or HD to maintain consistency with other actors which are not implementing the FHIR specification. 

IHE imposes the following restrictions on the FHIR Identifier datatype for a Patient:
* Both the value and system shall be populated. See Appendix Z.9.1 Identifier Type
* The assigner attribute may be populated (the name of the organization which assigned the identifier). When the assigning authority name is provided, the actor shall also populate the display attribute.

