# Advised

This folder shows results from our advisory step of the inventory processing pipeline. This step is split into three 
major phases.

### Vulnerability Data Mirror
The purpose of the data mirror is to download data from a variety of vulnerability data sources into a local directory 
and create an index from it. These indices are purpose-built for specific scenarios that appear in the inventory enrichment,
meaning there may be multiple indices built from a single download, or multiple downloads merged into a single index.

### Inventory Enrichment Pipeline
The inventory enrichment process is responsible for transforming an input inventory of software components into an 
enriched/advised inventory that contains additional information about the components. This information includes CPE 
URIs, vulnerability data, security advisories and other data.

The process uses a pipeline model to represent the individual steps involved, where each step can be enabled or disabled
as needed and can be configured with specific parameters.

### Dashboard generation

The {metaeffekt} Vulnerability Assessment Dashboard (VAD) enables the user to get a consolidated view on all 
vulnerabilities within a given Software or Hardware Asset. Different views and filters offer a degree of 
customizability to sort advisories by a variety of factors relevant to the end-user.

## Observations and TODOs

### General
- UI/UX has to be overhauled completely to improve User Experience (Currently in Progress)
- Functions are not clearly explained or visible at all to the user
- Explanation texts which do exist are too long and convoluted.

### Advisories

### Additional Information

Additional information about how the advisory step works in detail can be found in our documentation
project here:
https://github.com/org-metaeffekt/metaeffekt-documentation/blob/main/metaeffekt-vulnerability-management/vulnerability-management.md

