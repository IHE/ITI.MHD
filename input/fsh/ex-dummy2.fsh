Instance:   ex-patient2
InstanceOf: Patient
Title:      "Dummy Patient example"
Description: "Dummy patient example for completeness sake. No actual use of this resource other than an example target"

Instance:   ex-dummyPatientBundle
InstanceOf: Bundle
Title:      "Dummy Patient feed"
Description: "Example of a patient feed transaction Bundle."
* type = #transaction
* timestamp = 2020-11-24T23:50:50-05:00
* entry.resource = ex-patient2
* entry.fullUrl = "http://www.example.org/fhir/Patient/593cd04e-b696-45c1-bc32-39e55a340a99"
* entry.request.url = "Patient"
* entry.request.method = #POST



