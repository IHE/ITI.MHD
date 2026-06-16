Profile:        FindDocumentReferencesResponseFullTextSearch
Parent:         Bundle
Id:             IHE.MHD.FindDocumentReferencesResponseMessageFullTextSearch
Title:          "MHD Find Document References Response message with Full-Text Search Option"
Description:    "A profile on the Find Document References Response message for ITI-67 with Full-Text Search Option"
* type = #searchset (exactly)
* total 1..
* entry ^slicing.discriminator[0].type = #profile
* entry ^slicing.discriminator[0].path = "resource"
* entry ^slicing.rules = #open
* entry.fullUrl 1..
* entry contains DocumentReference 0..*
* entry[DocumentReference] ^short = "DocumentReference"
* entry[DocumentReference]
  * resource 1..
  * resource only MinimalDocumentReference
  * search 1..1
    * mode 1..1
      * ^short = "Indicates how a document was included in the full-text search result (i.e. as a direct match, by relationship, or as supplementary information)."
      * ^definition = """
      This element describes how a document identified during a full-text search was included in the search result. It indicates whether the document directly satisfies the search criteria or was included for other contextual reasons.

      In the context of full-text search on documents, the following values are used:
      * match: The document contains content that directly matches the specified search criteria and is considered a relevant hit.
      * include: The document was included in the result due to a relationship with another relevant document or contextual linkage.
      * outcome: The document provides additional information related to the search request, such as indications about result completeness or technical metadata.
      """
    * score 1..1
      * ^short = "Represents the relevance of a document to the search query based on a calculated relevance value."
      * ^definition = """
      The score element indicates the relevance value of a document in the context of a full-text search. This value is calculated based on the degree of correspondence between the search query and the document content. A higher score indicates a stronger relevance to the specified search criteria.
      """
    * extension contains
      FullTextSearchMatchSnippet named matchSnippet 0.. and
      FullTextSearchMatchTotalHits named totalHits 0..1


Extension: FullTextSearchMatchSnippet
Id: ihe-full-text-search-match-snippet
Title: "Full-Text Search Match Snippet"
Description: "This extension contains a text snippet describing the context of a full-text search match. It highlights relevant content that corresponds to the provided search terms and provides a concise preview of the search result."
* ^context.type = #element
* ^context.expression = "Bundle.entry.search"
* extension ^slicing.rules = #closed
* extension contains
    snippet 0..1 and
    pageNumber 0..1
* extension[snippet]
  * value[x] only string
  * valueString 1..1
    * ^short = "Human-readable text snippet describing the context of the search match."
    * ^definition = "This value contains a short, human-readable text snippet that describes the context of the search match. It enables quick orientation by presenting relevant content from the identified document or resource."
* extension[pageNumber]
  * value[x] only string
  * valueString 1..1
    * ^short = "For paginated documents (e.g. PDF), indicates the page on which the full-text search match was found."
    * ^definition = "For documents with pagination, such as PDF files, this element may be used to indicate the specific page on which the full-text search identified a match."


Extension: FullTextSearchMatchTotalHits
Id: ihe-full-text-search-match-total-hits
Title: "Full-Text Search Match Total Hits"
Description: "This extension contains the total number of full-text search matches found within a document (e.g. a PDF)."
* ^context.type = #element
* ^context.expression = "Bundle.entry.search"
* value[x] only integer
* valueInteger 1..1
  * ^short = "Total number of matches found within this document."
  * ^definition = "Indicates the total number of matches identified by a full-text search within this document."
