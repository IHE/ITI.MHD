Alias: $loinc = http://loinc.org
Alias: $v3-ActCode = http://terminology.hl7.org/CodeSystem/v3-ActCode
Alias: $sct = http://snomed.info/sct
Alias: $dose-rate-type = http://terminology.hl7.org/CodeSystem/dose-rate-type
Alias: $allergyintolerance-clinical = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical
Alias: $allergyintolerance-verification = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification

Instance: ex-fhir-document-bundle
InstanceOf: Bundle
Title: "Example of a FHIR-Document Bundle"
Description: "An example of a FHIR-Document Bundle"
Usage: #example
* meta.lastUpdated = "2013-05-28T22:12:21Z"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:0c3151bd-1cbf-4d64-b04d-cd9187a4c6e0"
* type = #document
* timestamp = "2013-05-28T22:12:21Z"
* entry[0].fullUrl = "http://example.org/fhir/Composition/180f219f-97a8-486d-99d9-ed631fe4fc57"
* entry[=].resource = 180f219f-97a8-486d-99d9-ed631fe4fc57
* entry[+].fullUrl = "http://example.org/fhir/Practitioner/fdoc-practitioner"
* entry[=].resource = fdoc-practitioner
* entry[+].fullUrl = "http://example.org/fhir/Patient/fdoc-patient"
* entry[=].resource = fdoc-patient
* entry[+].fullUrl = "http://example.org/fhir/Encounter/fdoc-encounter"
* entry[=].resource = fdoc-encounter
* entry[+].fullUrl = "http://example.org/fhir/Observation/fdoc-observation"
* entry[=].resource = fdoc-observation
* entry[+].fullUrl = "http://example.org/fhir/MedicationRequest/fdoc-medicationrequest"
* entry[=].resource = fdoc-medicationrequest
* entry[+].fullUrl = "http://example.org/fhir/MedicationStatement/fdoc-medicationstatement"
* entry[=].resource = fdoc-medicationstatement
* entry[+].fullUrl = "http://example.org/fhir/AllergyIntolerance/fdoc-allergyintolerance"
* entry[=].resource = fdoc-allergyintolerance

Instance: 180f219f-97a8-486d-99d9-ed631fe4fc57
InstanceOf: Composition
Usage: #inline
* meta.lastUpdated = "2013-05-28T22:12:21Z"
* status = #final
* type = $loinc#28655-9
* type.text = "Discharge Summary from Responsible Clinician"
* subject = Reference(fdoc-patient)
* encounter = Reference(fdoc-encounter)
* date = "2013-02-01T12:30:02Z"
* author = Reference(fdoc-practitioner)
* title = "Discharge Summary"
* section[0].title = "Reason for admission"
* section[=].code = $loinc#29299-5 "Reason for visit Narrative"
* section[=].text.status = #additional
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n\n              <table>\n\n                <thead>\n\n                  <tr>\n\n                    <td>Details</td>\n\n                    <td/>\n\n                  </tr>\n\n                </thead>\n\n                <tbody>\n\n                  <tr>\n\n                    <td>Acute Asthmatic attack. Was wheezing for days prior to admission.</td>\n\n                    <td/>\n\n                  </tr>\n\n                </tbody>\n\n              </table>\n\n            </div>"
* section[=].entry = Reference(fdoc-observation)
* section[+].title = "Medications on Discharge"
* section[=].code = $loinc#10183-2 "Hospital discharge medications Narrative"
* section[=].text.status = #additional
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n\n              <table>\n\n                <thead>\n\n                  <tr>\n\n                    <td>Medication</td>\n\n                    <td>Last Change</td>\n\n                    <td>Last ChangeReason</td>\n\n                  </tr>\n\n                </thead>\n\n                <tbody>\n\n                  <tr>\n\n                    <td>Theophylline 200mg BD after meals</td>\n\n                    <td>continued</td>\n\n                  </tr>\n\n                  <tr>\n\n                    <td>Ventolin Inhaler</td>\n\n                    <td>stopped</td>\n\n                    <td>Getting side effect of tremor</td>\n\n                  </tr>\n\n                </tbody>\n\n              </table>\n\n            </div>"
* section[=].entry[0] = Reference(fdoc-medicationrequest)
* section[=].entry[+] = Reference(fdoc-medicationstatement)
* section[+].title = "Known allergies"
* section[=].code = $loinc#48765-2 "Allergies and adverse reactions Document"
* section[=].text.status = #additional
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n\n              <table>\n\n                <thead>\n\n                  <tr>\n\n                    <td>Allergen</td>\n\n                    <td>Reaction</td>\n\n                  </tr>\n\n                </thead>\n\n                <tbody>\n\n                  <tr>\n\n                    <td>Doxycycline</td>\n\n                    <td>Hives</td>\n\n                  </tr>\n\n                </tbody>\n\n              </table>\n\n            </div>"
* section[=].entry = Reference(fdoc-allergyintolerance)

Instance: fdoc-practitioner
InstanceOf: Practitioner
Usage: #inline
* identifier.system = "http://www.acme.org/practitioners"
* identifier.value = "23"
* name.family = "Careful"
* name.given = "Adam"
* name.prefix = "Dr"

Instance: fdoc-patient
InstanceOf: Patient
Usage: #inline
* active = true
* name.text = "Eve Everywoman"
* name.family = "Everywoman1"
* name.given = "Eve"
* telecom.system = #phone
* telecom.value = "555-555-2003"
* telecom.use = #work
* gender = #female
* birthDate = "1955-01-06"
* address.use = #home
* address.line = "2222 Home Street"

Instance: fdoc-encounter
InstanceOf: Encounter
Usage: #inline
* identifier.value = "S100"
* identifier.system = "http://www.example.org/encounters"
* status = #finished
* class = $v3-ActCode#IMP "inpatient encounter"
* type.text = "Orthopedic Admission"
* subject = Reference(fdoc-patient)
* period.start = "2013-01-20T12:30:02Z"
* period.end = "2013-02-01T12:30:02Z"
* hospitalization.dischargeDisposition.text = "Discharged to care of GP"

Instance: fdoc-observation
InstanceOf: Observation
Usage: #inline
* status = #final
* code = $loinc#46241-6
* code.text = "Reason for admission"
* subject = Reference(fdoc-patient)
* encounter = Reference(fdoc-encounter)
* valueString = "Acute Asthmatic attack. Was wheezing for days prior to admission."

Instance: fdoc-medicationrequest
InstanceOf: MedicationRequest
Usage: #inline
* status = #unknown
* intent = #order
* medicationCodeableConcept.coding = $sct#66493003
* medicationCodeableConcept.text = "Theophylline 200mg"
* subject = Reference(fdoc-patient)
* requester = Reference(fdoc-practitioner)
* reasonCode.text = "Management of Asthma"
* dosageInstruction.additionalInstruction.text = "Take with Food"
* dosageInstruction.timing.repeat.frequency = 2
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.route = $sct#394899003 "oral administration of treatment"
* dosageInstruction.doseAndRate.type = $dose-rate-type#ordered "Ordered"
* dosageInstruction.doseAndRate.doseQuantity = 1 http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm#TAB "tablet"

Instance: fdoc-medicationstatement
InstanceOf: MedicationStatement
Usage: #inline
* status = #active
* statusReason.text = "Management of Asthma"
* medicationCodeableConcept.text = "Ventolin Inhaler"
* subject = Reference(fdoc-patient)
* dateAsserted = "2013-05-05T16:13:03Z"

Instance: fdoc-allergyintolerance
InstanceOf: AllergyIntolerance
Usage: #inline
* clinicalStatus = $allergyintolerance-clinical#active "Active"
* verificationStatus = $allergyintolerance-verification#confirmed "Confirmed"
* type = 	http://hl7.org/fhir/allergy-intolerance-type#allergy
* criticality = #high
* code.text = "Doxycycline"
* patient = Reference(fdoc-patient)
* recordedDate = "2012-09-17"
* reaction.manifestation.text = "Hives"
