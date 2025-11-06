Profile: UniqueIdIdentifier
Parent: Identifier
Id: IHE.MHD.UniqueIdIdentifier
Title: "uniqueId Identifier"
Description: "uniqueId Identifier

- see [Appendix Z](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.9.1-identifier-type)"
* system 1..
* use 1..
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
* use 1..
* use = #official

Invariant: mhd-startswithuuid
Description: "value must start with urn:uuid:"
Severity: #error
Expression: "startsWith('urn:uuid:')"

Extension: HomeCommunityId
Id: ihe-HomeCommunityId
Title: "The homeCommunityId where this artifact lives"
Description: "The globally unique, immutable, identifier of the homeCommunityId entity where this artifact exists. The format of the identifier is an OID."
* ^context[+].type = #element
* ^context[=].expression = "DocumentReference"
* ^context[+].type = #element
* ^context[=].expression = "List"
* value[x] only Identifier
* valueIdentifier 1..1
* valueIdentifier.system = "urn:ietf:rfc:3986" //(exactly)
* valueIdentifier.value obeys mhd-startswithoid



Extension: RetrieveLocationUID
Id: ihe-RetrieveLocationUID
Title: "The repositoryUniqueId where the document lives"
Description: "The globally unique, immutable, identifier of the repositoryUniqueId entity where the document exists. The format of the identifier is an OID."
* ^context[+].type = #element
* ^context[=].expression = "DocumentReference"
* value[x] only Identifier
* valueIdentifier 1..1
* valueIdentifier.system = "urn:ietf:rfc:3986" //(exactly)
* valueIdentifier.value obeys mhd-startswithoid


Instance: IHE-HomeCommunityIds
InstanceOf: SearchParameter
Title: "search on the IHE defined extension for homeCommunityId"
Usage: #definition
* url = "https://profiles.ihe.net/ITI/MHD/SearchParameter/IHE-HomeCommunityIds"
* description = "This SearchParameter enables finding Lists by the homeCommunityId where DocumentReference, submissionSet, or folder exist."
* name = "HomeCommunityId"
* status = #active
* code = #homeCommunityId
* base[+] = #List
* base[+] = #DocumentReference
* expression = "(extension('https://profiles.ihe.net/ITI/MHD/StructureDefinition/ihe-HomeCommunityId').value.ofType(Identifier))"
* type = #token

