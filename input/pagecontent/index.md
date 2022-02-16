
Applications specific to resource-constrained and mobile devices are an emerging platform for healthcare-enhancing software. The MHD Profile is not limited to mobile devices, using the term “mobile” only as a grouping for mobile applications, mobile devices or any other systems that are resource and platform-constrained. These constraints may drive the implementer to use simpler network interface technology. There are numerous deployed implementations of [Document Sharing Health Information Exchange](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) that need a simpler network interface technology, for example those hosted by a Health Information Exchange (HIE), large health provider electronic health record (EHR), or personal health record (PHR). 

The Mobile access to Health Documents (MHD) Profile defines one standardized interface to [health document sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) (a.k.a. an Application Programming Interface (API)) for use by mobile devices so that deployment of mobile applications is more consistent and reusable. In this context, mobile devices include tablets, smart-phones, and embedded devices including home-health devices. This profile is also applicable to more capable systems where needs are simple, such as pulling the latest summary for display. The critical aspects of the "mobile device" are that it is resource-constrained, has a simple programming environment (e.g., JSON, JavaScript), simple protocol stack (e.g., HTTP), and simple display functionality (e.g., HTML browser). The goal is, in part, to avoid burdening the client with additional libraries such as those that are necessary to process SOAP, WSSE, MIME-Multipart, MTOM/XOP, ebRIM, and multi-depth XML. 

The Mobile access to Health Documents (MHD) Profile defines one pair of actors and a transaction to submit or push new “document entries” from the mobile device to a receiving system. Another set of actors and transactions is used to query a list of “document entries” having specific metadata, and to retrieve a document. 

The transactions defined here leverage the [document content- and format-agnostic metadata concepts](https://profiles.ihe.net/ITI/TF/Volume3/index.html#4) that were initially developed for [XDS](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html) but simplify them for access in constrained environments including mobile devices. 

The MHD Profile can be used as an [API to a Document Sharing exchange using XDS](1336_cross_profile_considerations.html#13361-mhd-actor-grouped-with-xds-infrastructure) or [XCA](1336_cross_profile_considerations.html#13362-mhd-actors-grouped-with-xca-infrastructure). The MHD Profile is used by the [MHDS Document Sharing](https://profiles.ihe.net/ITI/TF/Volume1/ch-50.html) solution. The MHD Profile can be used in [push solutions](1334_overview.html#133422-publication-of-new-documents-process-flow) alone or as an API to solutions like XDR or XDM. These are further elaborated in [Cross Profile Considerations](1336_cross_profile_considerations.html)

The [Mobile Cross-Enterprise Document Data Element Extraction (mXDE)](https://profiles.ihe.net/ITI/TF/Volume1/ch-45.html) Profile combines MHD with the PCC Query for Existing Data for Mobile (QEDm) Profile to provide element level access to the medical information available in a Document Sharing exchange. More details can be found in the white paper on [Document Sharing Health Information Exchange](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html).

MHD is part of [IHE](https://profiles.ihe.net) -- [IT-Infrastructure](https://profiles.ihe.net/ITI) Domain and 
part of the [IHE Document Sharing Health Information Exchange](https://profiles.ihe.net/ITI/HIE-Whitepaper) solution.

<div markdown="1" class="stu-note">

| [Significant Changes, Open, and Closed Issues](a_issues.html) |
{: .grid}

**[Search this IG](https://www.google.com/search?q=site%3Ahttps%3A%2F%2Fprofiles.ihe.net%2FITI%2FMHD&rlz=1C1GCEU_enUS815US815&sxsrf=ALeKk02egtK8A20vWkRrPApvkcoQjnIiDA%3A1620864970799&ei=ym-cYPmMMMq6tQa8vre4CA&oq=site%3Ahttps%3A%2F%2Fprofiles.ihe.net%2FITI%2FMHD&gs_lcp=Cgdnd3Mtd2l6EANQ7CZYmDBg9TdoAXAAeACAAWaIAcIDkgEDNS4xmAEAoAEBqgEHZ3dzLXdpesABAQ&sclient=gws-wiz&ved=0ahUKEwj5mcDGsMXwAhVKXc0KHTzfDYcQ4dUDCA4&uact=5)**

</div>

#### Organization of This Guide 

This guide is organized into four main sections:

1. Volume 1: Use-Case analysis
   1. [33.1 MHD Actors and Transactions](1331_actors_and_transactions.html)
   1. [33.2 MHD Actor Options](1332_actor_options.html)
   1. [33.3 MHD Actor Required Groupings](1333_required_grouping.html)
   1. [33.4 MHD Overview](1334_overview.html)
   2. [33.5 MHD Security Considerations](1335_security_considerations.html)
   3. [33.6 MHD Cross Profile Considerations](1336_cross_profile_considerations.html)

2. Volume 2: Transaction Detail
   1. [3.65 Provide Document Bundle [ITI-65]](ITI-65.html)
   2. [3.66 Find Document Lists [ITI-66]](ITI-66.html)
   3. [3.67 Find Document References [ITI-67]](ITI-67.html)
   4. [3.68 Retrieve Document [ITI-68]](ITI-68.html)

3. Volume 3: Metadata
   1. [4.2 XDS Error Codes](31_xds.html)
   1. [4.5 FHIR Representation](32_fhir_maps.html)
   
4. Appendix
	1. [Test Plan](testplan.html)

Click on any of the links above, head on over the [table of contents](toc.html), or
if you are looking for a specific artifact, check out the [index](artifacts.html).

#### Must Support

MHD defines `Must Support` in StructureDefinition profiles as the element, when the minimal cardionality is zero, is **R2** `Required if Known`, as found in [Appendix Z](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.10-profiling-conventions-for-constraints-on-fhir). `Must Support` when the element minimal cardionality is not zero means **R**.

#### Download 

You can also download:

* [this entire guide](full-ig.zip),
* the definition resources in [json](definitions.json.zip), [xml](definitions.xml.zip), [ttl](definitions.ttl.zip), or [csv](csvs.zip) format, or
* the example resources in [json](examples.json.zip), [xml](examples.xml.zip) or [ttl](examples.ttl.zip) format.

The source code for this Implementation Guide can be found on IHE GitHub [https://github.com/IHE/ITI.MHD](https://github.com/IHE/ITI.MHD).
