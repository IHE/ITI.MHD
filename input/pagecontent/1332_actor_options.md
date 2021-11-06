
Options that may be selected for each actor in this implementation guide, are listed in Table 1:33.2-1 below. Dependencies 
between options when applicable are specified in notes.

<table border="1" style="border: 1px solid black; border-collapse: collapse">
    <caption><b>Table 1:33.2-1 Actor Options</b></caption>
    <thead>
        <tr style="background: gray;" class="odd">
            <td>Actor</td>
            <td>Option Name</td>
        </tr>
    </thead>
    <tbody>
        
                <tr>
                
                    <td rowspan='2'>Document Source</td>
                
                <td><a href="#13321-comprehensive-metadata-option">Comprehensive Metadata</a></td>
                </tr>
                <tr>
                
                <td><a href="#13323-uncontained-reference-option">UnContained Reference</a></td>
                </tr>

                <tr>
                
                    <td rowspan='3'>Document Recipient</td>
                
                <td><a href="#13321-comprehensive-metadata-option">Comprehensive Metadata</a></td>
                </tr>
                <tr>
                
                <td><a href="#13322-xds-on-fhir-option">XDS on FHIR</a></td>
                </tr>
                <tr>
                
                <td><a href="#13323-uncontained-reference-option">UnContained Reference</a></td>
                </tr>
                        
                <tr>
                
                    <td rowspan='1'>Document Consumer</td>
                
                <td><a href="#13323-uncontained-reference-option">UnContained Reference</a></td>
                </tr>
            
                <tr>
                
                    <td rowspan='2'>Document Responder</td>
                                
                <td><a href="#13322-xds-on-fhir-option">XDS on FHIR</a></td>
                </tr>
                <tr>
                
                <td><a href="#13323-uncontained-reference-option">UnContained Reference</a></td>
                </tr>
    </tbody>
</table>

        
The options in this guide are described in more detail in the sections below.

#### 1:33.2.1 Comprehensive Metadata Option

Support of this option assures that the Document Source will provide comprehensive metadata. Comprehensive metadata fulfill the cardinality requirements of XDS. 

A Document Source that supports this option will provide metadata consistent with the additional document sharing requirements for an XDS Document Source described in [ITI TF-3: 4.3.1- Submission Metadata Attribute Optionality](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.3.html#4.3.1) and [ITI TF-3: 4.5.1 Metadata Object Types mapped to FHIR](32_fhir_maps.html).

A Document Recipient that supports this option will require that any metadata provided is consistent with the additional document sharing requirements for an XDS Document Source described in [ITI TF-3: 4.3.1- Submission Metadata Attribute Optionality](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.3.html#4.3.1).

#### 1:33.2.2 XDS on FHIR Option

The Document Recipient that supports this option shall be able to be grouped with an [XDS](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html) [Document Source](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.1.1) so that any publication request is passed on to that XDS environment. See the transaction specific requirements outlined in [ITI-65 XDS on FHIR Option](ITI-65.html#23654131-grouping-with-actors-in-other-document-sharing-profiles). The grouped XDS Document Source shall implement the [Document Replacement Option](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.2.1), [Document Addendum Option](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.2.2), [Document Transformation Option](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.2.3), and [Folder Management Option](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.2.4) to ensure that these functionalities can be transferred from the MHD Document Source through to the [XDS Document Registry](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.1.3).

The Document Responder that supports this option shall be able to be grouped with an [XDS Document Consumer](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.1.2) so that any query or retrieve requests can be passed on to, and responded to, by an XDS environment. The transaction specific requirements are outlined in [ITI-66 XDS on FHIR Options](ITI-66.html#23664131-xds-on-fhir-option) and [ITI-67 XDS on FHIR Option](ITI-67.html#23674131-xds-on-fhir-option). 

The [XDS on FHIR Option](#13322-xds-on-fhir-option) is not compatible with the [UnContained Reference Option](#13323-uncontained-reference-option). A system may be able to support both options, but only one will be able to be used at a given deployment.

#### 1:33.2.3 UnContained Reference Option

The [UnContained Reference Option](#13323-uncontained-reference-option) recognizes that a Community may choose to longitudinally maintain their provider and patient directories, for example, an [mCSD](https://profiles.ihe.net/ITI/TF/Volume1/ch-46.html) Care Services Selective Supplier and [PMIR](https://profiles.ihe.net/ITI/TF/Volume1/ch-49.html) Patient Identity Registry. When this longitudinal consistency is managed, then the author, authenticator, sourcePatientInfo, and author entries do not need to be a contained copy of the information known at the time of publication [ITI-65](ITI-65.html) since a Reference to the information in these directories will be valid over the full lifecycle of the entries. 

The actors that support the [UnContained Reference Option](#13323-uncontained-reference-option) shall be able to create and consume full URL values in the DocumentReference.author, the DocumentReference.authenticator, the DocumentReference.context.sourcePatientInfo, and the DocumentManifest.author. This requirement encourages the persisting of the information at the time the document is published. 

The [UnContained Reference Option](#13323-uncontained-reference-option) is not compatible with the [XDS on FHIR Option](#13322-xds-on-fhir-option). A system may be able to support both options, but only one will be able to be used at a given deployment.
