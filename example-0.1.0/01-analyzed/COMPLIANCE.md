# Compliance

The following sections aim to identify the compliance criteria met in the provided documents
with respect to **NTIA's Minimum Elements for a Software Bill of Materials** and **BSI TR-03183 Part 2**.

Additionally, we will outline our current development status regarding SPDX and CycloneDX documents,
as well as our future plans to ensure compliance with both major guidelines.

## Overview

Below is an overview of both guidelines and which aspects have been implemented by the different
solutions provided. As *analyse* is the first step in our evaluation process, it is to be expected that various
required fields are still missing or that the provided information may not be complete. 

Fields are treated as compliant if they exist in the document for every applicable component,
the information contained within has not been verified as this is either not possible
or beyond the scope of this section. The specific requirements for each field are outlined
in their respective guidelines and will not be repeated here.
Fields not lead by "SBOM" should be considered component-fields.

The *Expectation* column gives insight into which fields we expect to be filled at a given stage of the inventory 
pipeline. Fields which have not been supplied yet are filled with NOASSERTION values in accordance with the SPDX spec, 
note that this is not the same as NONE. Only fields which can not be populated by NOASSERTION will be ignored entirely.

The *Stage* column describes at which stage / stages a given field is expected to be populated with information. This 
does not mean that ALL components will have a value assigned to said field, rather we predict that MOST components 
will have a value assigned after stage completion.

For all applicable

- x : Field exists | Value exists
- o : Field exists | Value might exist
- _ : Field might exist | Value might exist

### NTIA Minimum SBOM Elements

|                      | SPDX-2.3-Current | SPDX-2.3-New | SPDX-3.0.1 | CycloneDX 1.6 | _Expectation_ | _Stage_  |
|----------------------|------------------|--------------|------------|---------------|---------------|----------|
| SBOM Author          | x                | x            | x          | x             | MUST exist    | analyzed |
| SBOM Timestamp       | x                | x            | x          | x             | MUST exist    | analyzed |
| Name                 | x                | x            | x          | x             | MUST exist    | analyzed |
| Version              | o                | o            |            | -             | SOME exist    | resolved |
| Unique Identifiers   | x                | -            |            | o             | SOME exist    |          |
| Dependency Hierarchy | x                | x            | x          | x             | MUST exist    | analyzed |
| Supplier             | o                | o            |            | -             | SOME exist    |          |

### TR-03183 Part 2

|                      | SPDX-2.3-Current | SPDX-2.3-New | SPDX-3.0.1 | CycloneDX 1.6 | _Expectation_ | _Stage_  |
|----------------------|------------------|--------------|------------|---------------|---------------|----------|
| SBOM Creator         | x                | x            | x          | x             | MUST exist    | analyzed |
| SBOM Timestamp       | x                | x            | x          | x             | MUST exist    | analyzed |
| SBOM URI             | x                | x            | x          | x             | MUST exist    | analyzed |
| Creator URL          | o                | o            |            | -             | SOME exist    | resolved |
| Name                 | x                | x            | x          | x             | MUST exist    | analyzed |
| Version              | x                | o            | o          | -             | MUST exist    | resolved |
| Filename             | x                | x            | x          | x             | MUST exist    | analyzed |
| Dependency Hierarchy | x                | x            | x          | x             | MUST exist    | analyzed |
| Associated Licenses  | o                | o            |            |               | MUST exist    | scanned  |
| Concluded Licenses   | o                | o            |            |               | SOME exist    | scanned  |
| Executable           | o                | o            |            |               | NONE exist    | resolved |
| Archive              | x                | x            |            | x             | SOME exist    | resolved |
| Structured           | x                | x            |            | x             | SOME exist    | resolved |
| Source Code URI      | o                | o            |            |               | NONE exist    | resolved |
| Deployable URI       | o                | o            |            |               | SOME exist    | resolved |
| Unique Identifiers   | x                | -            | -          | -             | SOME exist    | resolved |
| SHA-512 Hash         |                  |              |            |               | MUST exist    | resolved |

## Section Specific Statements

As this inventory was extracted solely from a POM file it is only meant to showcase some key features and provide a 
first representation of a baseline inventory in our processing pipeline. In other words we do not expect the documents 
produced by using this inventory as input to match our expectations for guideline compliance, as usually more than a 
POM file is provided.
