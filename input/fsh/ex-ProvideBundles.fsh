Instance:   ex-minimalProvideDocumentBundle
InstanceOf: IHE.MHD.Minimal.ProvideBundle
Title:      "Provide Document Bundle with Minimal metadata"
Description: "Example of a minimal Provide Document Bundle. "
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #transaction
* timestamp = 2020-11-24T23:50:50-05:00
* entry[SubmissionSet].resource = ex-minimalSubmissionSet
* entry[SubmissionSet].request.url = "urn:uuid:be9aad8b-3910-4405-98c7-695dc656670e"
* entry[SubmissionSet].request.method = #POST
* entry[DocumentRefs].resource = ex-DocumentReferenceMinimal
* entry[DocumentRefs].request.url = "urn:uuid:4fb5741f-732f-4d4c-b4ff-ec251dce7f32"
* entry[DocumentRefs].request.method = #POST
* entry[Folders].resource = ex-minimalFolder
* entry[Folders].request.url = "urn:uuid:b287e962-37da-43ff-9480-8e6b3b388f54"
* entry[Folders].request.method = #POST
