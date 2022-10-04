Profile: UniqueIdIdentifier
Parent: Identifier
Id: IHE.MHD.UniqueIdIdentifier
Title: "uniqueId Identifier"
Description: "uniqueId Identifier holding a OID"
* system 1..
* system = "urn:ietf:rfc:3986" (exactly)
* use = #usual
* value 1..
* value obeys mhd-startswithoid

Invariant: mhd-startswithoid
Description: "value must start with urn:oid:"
Severity: #error
Expression: "value.startsWith('urn:oid:')"

Profile: EntryUUIDIdentifier
Parent: Identifier
Id: IHE.MHD.EntryUUID.Identifier
Title: "entryUUID Identifier"
Description: "entryUUID Identifier holding a UUID"
* system 1..
* system = "urn:ietf:rfc:3986" (exactly)
* value 1..
* value obeys mhd-startswithuuid
* use = #official

Invariant: mhd-startswithuuid
Description: "value must start with urn:uuid:"
Severity: #error
Expression: "value.startsWith('urn:uuid:')"