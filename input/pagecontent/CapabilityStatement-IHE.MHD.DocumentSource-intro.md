This is the **Requirements** CapabilityStatement for a [Document Source](2_actors_and_transactions.html#document-source) with no declared [Options](2_actors_and_transactions.html#actor-options), or all declared [Options](2_actors_and_transactions.html#actor-options). This Actor is allowed to use Minimal Metadata, [Comprehensive Metadata](2_actors_and_transactions.html#comprehensive-metadata-option) Option, [XDS on FHIR](2_actors_and_transactions.html#xds-on-fhir-option) Option, or [UnContained Comprehensive Metadata](2_actors_and_transactions.html#uncontained-reference-option).

The [Document Source](2_actors_and_transactions.html#document-source) uses the [Provide Document Bundle ITI-65](ITI-65.html) to communicate metadata and documents to the [Document Recipient](2_actors_and_transactions.html#document-recipient).

<div>
{%include ITI-65-seq.svg%}
</div>

<div style="clear: left"/>

**Figure: Provide Document Bundle Interactions**



