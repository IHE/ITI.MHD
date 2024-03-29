This is the **Requirements** CapabilityStatement for a [Document Recipient](1331_actors_and_transactions.html#133113-document-recipient) with UnContained Reference declared [Option](1332_actor_options.html). 
This actor must use either [Comprehensive Metadata](1332_actor_options.html#13321-comprehensive-metadata-option) Option or UnContained Reference or [UnContained Reference](1332_actor_options.html#13323-uncontained-reference-option) Option.
Note that the [UnContained Reference](1332_actor_options.html#13323-uncontained-reference-option) Option can not be used with [XDS on FHIR](1332_actor_options.html#13322-xds-on-fhir-option) Option. 

The [Document Source](1331_actors_and_transactions.html#133111-document-source) uses the [Provide Document Bundle ITI-65](ITI-65.html) to communicate metadata and documents to the [Document Recipient](1331_actors_and_transactions.html#133113-document-recipient).

<div>
{%include ITI-65-seq.svg%}
</div>

<br clear="all">

**Figure: Provide Document Bundle Interactions**



