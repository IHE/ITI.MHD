Example of a minimal Provide Document Bundle for a push to an email intended recipient.
- The bundle contains
  - SubmissionSet - identifies to whom this is going and one documentReference
  - DocumentReference - One DocumentReference
  - Binary - the document
  - the Patient is contained in the DocumentReference. This would be more classic XDR/XDM model. Note there is no mention of the patient in the SubmissionSet in this case (hence minimal metadata), and if multiple documents were sent they would implicitly be the same patient, presumably with the same contained Patient; but given it is a contained Patinet there is no way to computably prove this beyond exact comparison of the contained object.
  
Response [example](Bundle-ex-response-minimalProvideDocumentBundleSimpleContained.html)
  