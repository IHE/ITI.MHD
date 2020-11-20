Profile:        AuditProvideBundleDest
Parent:         AuditEvent
Id:             IHE.MHD.ProvideBundle.Audit.Dest
Title:          "Audit Event for Provide Bundle Transaction"
Description:    "Defines constraints on the AuditEvent Resource to record when a Provide Bundle Transaction happens."
* ^version = "3.1.1"
* ^date = "2020-02-01"
* ^publisher = "Integrating the Healthcare Enterprise (IHE)" 
* ^contact[0].name = "IHE"
* ^contact[0].telecom.system = #url
* ^contact[0].telecom.value = "http://ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom.system = #email
* ^contact[1].telecom.value = "JohnMoehrke@gmail.com"
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property" 

* type = http://dicom.nema.org/resources/ontology/DCM#110107 "Import"
* action = #C
* subtype = urn:ihe:event-type-code#ITI-65 "Provide Document Bundle"
// .source is already required to be populated - what agent detected the event usually one of the .agent systems sending or receiving
// .agent holds system that received, system that sent, and if known the human(s) who triggered
// .entity holds the patient identity, and the identifier of the submission
