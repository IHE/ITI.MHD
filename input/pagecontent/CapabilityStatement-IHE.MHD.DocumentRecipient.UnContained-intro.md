This is the **Requirements** CapabilityStatement for a [Document Recipient](2_actors_and_transactions.html#document-recipient) with UnContained Reference declared [Option](2_actors_and_transactions.html#actor-options). 
This actor must use either [Comprehensive Metadata](2_actors_and_transactions.html#comprehensive-metadata-option) Option or UnContained Reference or [UnContained Reference](2_actors_and_transactions.html#uncontained-reference-option) Option.
Note that the [UnContained Reference](2_actors_and_transactions.html#uncontained-reference-option) Option can not be used with [XDS on FHIR](2_actors_and_transactions.html#xds-on-fhir-option) Option. 

The [Document Source](2_actors_and_transactions.html#document-source) uses the [Provide Document Bundle ITI-65](ITI-65.html) to communicate metadata and documents to the [Document Recipient](2_actors_and_transactions.html#document-recipient).

<div>
{%include ITI-65-seq.svg%}
</div>

<div style="clear: left"/>

**Figure: Provide Document Bundle Interactions**



