This is the **Requirements** CapabilityStatement for a [Document Consumer](1331_actors_and_transactions.html#133112-document-consumer). The Document Consumer may  declared the UnContained References [Options](1332_actor_options.html). This Actor is allowed to use [Find Document List ITI-66](ITI-66.html), [Find Document References ITI-67](ITI-67.html), and [Retrieve Document ITI-68](ITI-68.html) transactions. The Document Consumer Actor should be robust for unconstrained DocumentReference and List Resources, as the results returned to the Document Consumer from the Document Responder may not follow the conformance constraints.

<div>
{%include QueryActors.svg%}
</div>

<div style="clear: left"/>

**Figure: Query Actors Interactions**

