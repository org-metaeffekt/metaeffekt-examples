# Compliance

The following sections aim to identify the compliance criteria met in the provided documents
with respect to **NTIA's Minimum Elements for a Software Bill of Materials** and **BSI TR-03183 Part 2**.

Additionally, we will outline our current development status regarding SPDX and CycloneDX documents,
as well as our future plans to ensure compliance with both major guidelines.

## Overview

Below is an overview of both guidelines and which aspects have been implemented by the different
solutions provided. As this is the first step in our enrichment process, it is to be expected that fields
required are still missing or that the information contained within may not be complete. 

Fields are treated as compliant if they exist in the document for every applicable component,
the information contained within has not been verified as this is either not possible
or beyond the scope of this section. The specific requirements for each field are outlined
in their respective guidelines and will not be repeated here.
Fields not lead by "SBOM" should be considered component-fields.

The Expectation column gives insight into what fields we expect to be filled at what stage of the
inventory pipeline. Fields who have not been enriched yet are filled with NOASSERTION values in
accordance with the SPDX spec, note that this is not the same as NONE. Only fields which can not be populated
by NOASSERTION will be ignored entirely.

The "Mainly processed" column describes which stage / stages are mainly responsible for filling the given field
with information. This does not mean that ALL components will have a value assigned to said field, rather we
predict that MOST components will have a value assigned after stage completion.

For all applicable
- x : [Field exists] [Value exists]
- o : [Field exists] [Value might exist]
- _ : [Field might exist] [Value might exist]

### NTIA Minimum SBOM Elements

|                      | SPDX-2.3-Current | SPDX-2.3-New | SPDX-3.0.1 | CycloneDX 1.6 | _Expectation_ | _Mainly processed_ |
|----------------------|------------------|--------------|------------|---------------|---------------|--------------------|
| SBOM Author          | x                | x            | x          | x             | MUST exist    | analyzed           |
| SBOM Timestamp       | x                | x            | x          | x             | MUST exist    | analyzed           |
| Name                 | x                | x            | x          | x             | MUST exist    | analyzed           |
| Version              |                  |              |            |               | SOME exist    | resolved           |
| Unique Identifiers   |                  |              |            |               | SOME exist    |                    |
| Dependency Hierarchy | x                | x            | x          | x             | MUST exist    | analyzed           |
| Supplier             |                  |              |            |               | SOME exist    |                    |

### TR-03183 Part 2

|                      | SPDX-2.3-Current | SPDX-2.3-New | SPDX-3.0.1 | CycloneDX 1.6 | _Expectation_ | _Mainly processed_ |
|----------------------|------------------|--------------|------------|---------------|---------------|--------------------|
| SBOM Creator         | x                | x            | x          | x             | MUST exist    | analyzed           |
| SBOM Timestamp       | x                | x            | x          | x             | MUST exist    | analyzed           |
| SBOM URI             | x                | x            | x          | x             | MUST exist    | analyzed           |
| Creator URL          | o                |              |            | x             | SOME exist    | resolved           |
| Name                 | x                | x            | x          | x             | MUST exist    | analyzed           |
| Version              | o                | o            | o          | -             | MUST exist    | resolved           |
| Filename             | x                | x            | x          | x             | MUST exist    | analyzed           |
| Dependency Hierarchy | x                | x            | x          | x             | MUST exist    | analyzed           |
| Associated Licenses  | o                | o            |            |               | SOME exist    | scanned            |
| Concluded Licenses   | o                | o            |            |               | SOME exist    | scanned            |
| Executable           | o                |              |            |               | NONE exist    |                    |
| Archive              | o                |              |            | -             | SOME exist    |                    |
| Structured           | o                |              |            | -             | SOME exist    |                    |
| Source Code URI      | o                |              |            |               | NONE exist    | resolved           |
| Deployable URI       | o                |              |            |               | SOME exist    | resolved           |
| Unique Identifiers   | o                | o            | o          | o             | SOME exist    | resolved           |
| SHA-512 Hash         |                  |              |            |               | NONE exist    |                    |

## Section Specific Statements

### Trivy and Syft

Regarding Trivy and Syft, we will not make any assumptions or predictions about their level of compliance, as we have 
no insight into their operations, future development plans, or whether they intend to align with the BSI TR or NTIA 
guidelines in the future.
