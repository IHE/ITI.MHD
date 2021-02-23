This is the **Requirements** CapabilityStatement for a [Document Source](2_actors_and_transactions.html#document-source) with the UnContained declared [Option](2_actors_and_transactions.html#actor-options). 
This actor must use either [Comprehensive Metadata](2_actors_and_transactions.html#comprehensive-metadata-option) Option or UnContained Metadata or [UnContained Metadata](2_actors_and_transactions.html#uncontained-metadata-option) Option.
Note that the [UnContained Metadata](2_actors_and_transactions.html#uncontained-metadata-option) Option can not be used with [XDS on FHIR](2_actors_and_transactions.html#xds-on-fhir-option) Option. 

The [Document Source](2_actors_and_transactions.html#document-source) uses the [Provide Document Bundle ITI-65](ITI-65.html) to communicate metadata and documents to the [Document Recipient](2_actors_and_transactions.html#document-recipient).

<div>
{%include ITI-65-seq.svg%}
</div>

<div style="clear: left"/>

**Figure: Provide Document Bundle Interactions**



