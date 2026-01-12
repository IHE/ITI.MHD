Profile: UniqueIdIdentifier
Parent: Identifier
Id: IHE.MHD.UniqueIdIdentifier
Title: "uniqueId Identifier"
Description: "uniqueId Identifier

- see [Appendix Z](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.9.1-identifier-type)"
* system 1..
* value 1..
* type 1..1
* type = MHDIdentifierType#uniqueId

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
* type 1..1
* type = MHDIdentifierType#entryUUID

Invariant: mhd-startswithuuid
Description: "value must start with urn:uuid:"
Severity: #error
Expression: "startsWith('urn:uuid:')"

CodeSystem: MHDIdentifierType
Id: IHE.MHD.MHDIdentifierType
Title: "IHE MHD Identifier Types"
Description: "Code System for Identifier.type values defined in IHE MHD"
* ^caseSensitive = true
* ^experimental = false
* #entryUUID "Identifier type for XDS entryUUID"
* #uniqueId "Identifier type for XDS UniqueId"

ValueSet: MHDIdentifierTypeVS
Id: IHE.MHD.MHDIdentifierTypeVS
Title: "IHE MHD Identifier Types ValueSet"
Description: "ValueSet for Identifier.type values defined in IHE MHD"
* ^experimental = false
* MHDIdentifierType#entryUUID
* MHDIdentifierType#uniqueId