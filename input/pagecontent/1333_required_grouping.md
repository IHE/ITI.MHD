Actor(s) which are required to be grouped with other actor(s) are listed in this section. The grouped actor may be from this profile or a different domain/profile. 

An actor from this profile (Column 1) must implement all the required transactions in this profile in addition to all of the required transactions for the grouped profile/actor listed (Column 3).

**Table 1:33.3-1: MHD Required Actor Groupings**

| MHD Actor          | Grouping Condition | Actor(s) to be grouped with              | Reference      |
|--------------------|--------------------|------------------------------------------|----------------|
| Document Source    | -                  | None                                     | -              |
| Document Recipient | XDS on FHIR Option | XDS.b / Document Source / Document Replacement, Document Addendum, Document Transformation, and Folder Management Options | [ITI TF-1: 33.2.2](1332_actor_options.html#13322-xds-on-fhir-option) |
| Document Consumer  | -                  | None                                     | -              |
| Document Responder | XDS on FHIR Option | XDS.b / Document Consumer                | [ITI TF-1: 33.2.2](1332_actor_options.html#13322-xds-on-fhir-option) |
{: .grid}
