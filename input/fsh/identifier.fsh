Profile: UniqueIdIdentifier
Parent: Identifier
Id: IHE.MHD.UniqueIdIdentifier
Title: "uniqueId Identifier"
Description: "uniqueId Identifier

- see [Appendix Z](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.9.1-identifier-type)"
* system 1..
* use = #usual
* value 1..

Profile: SubmissionSetUniqueIdIdentifier
Parent: UniqueIdIdentifier
Id: IHE.MHD.SubmissionSetUniqueIdIdentifier
Title: "uniqueId Identifier for SubmissionSet"
Description: "uniqueId Identifier holding a OID"
* system = "urn:ietf:rfc:3986" (exactly)
* value obeys mhd-startswithoid

Invariant: mhd-startswithoid
Description: "value must start with urn:oid:"
Severity: #error
Expression: "startsWith('urn:oid:')"

Profile: EntryUUIDIdentifier
Parent: Identifier
Id: IHE.MHD.EntryUUID.Identifier
Title: "entryUUID Identifier"
Description: "entryUUID Identifier holding a UUID"
* system 1..
* system = "urn:ietf:rfc:3986" (exactly)
* value 1..
* value obeys mhd-startswithuuid
* use 1..1
* use = #official

CodeSystem:  MHDDocumentIDTypes 
Title: "MHD DocumentId Types"
Description:  "Different types of document IDs"
* ^caseSensitive = true
* ^experimental = false
* #entryUUID "DocumentEntry.entryUUID"
* #logicalID "DocumentEntry.logicalID"
* #uniqueID "DocumentEntry.uniqueID" 

Profile: LogicalIDIdentifier
Parent: Identifier
Id: IHE.MHD.LogicalID.Identifier
Title: "logicalID Identifier"
Description: "logicalID Identifier holding a UUID"
* system 1..
* system = "urn:ietf:rfc:3986" (exactly)
* value 1..
* value obeys mhd-startswithuuid
* use 0..0
* type 1..1
* type.coding = MHDDocumentIDTypes#logicalID

Invariant: mhd-startswithuuid
Description: "value must start with urn:uuid:"
Severity: #error
Expression: "startsWith('urn:uuid:')"