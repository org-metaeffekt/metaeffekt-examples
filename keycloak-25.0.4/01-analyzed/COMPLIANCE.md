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
or beyond the scope of this section.

The specific requirements for each field are outlined in their respective guidelines
and will not be repeated here. Fields not lead by "SBOM" should be considered component-fields.

### NTIA Minimum SBOM Elements

|                      | SPDX-2.3-Current | SPDX-2.3-New | SPDX-3.0.1 | CycloneDX 1.6 |
|----------------------|------------------|--------------|------------|---------------|
| SBOM Author          |         x        |       x      |      x     |       x       |
| SBOM Timestamp       |         x        |       x      |      x     |       x       |
| Name                 |         x        |       x      |      x     |       x       |
| Version              |         x        |       x      |      x     |       x       |
| Unique Identifiers   |         x        |       x      |      x     |       x       |
| Dependency Hierarchy |         x        |       x      |      x     |       x       |
| Supplier             |                  |              |            |               |

### TR-03183 Part 2

|                      | SPDX-2.3-Current | SPDX-2.3-New | SPDX-3.0.1 | CycloneDX 1.6 |
|----------------------|------------------|--------------|------------|---------------|
| SBOM Creator         |         x        |       x      |      x     | x             |
| SBOM Timestamp       |         x        |       x      |      x     | x             |
| SBOM URI             |         x        |       x      |      x     | x             |
| Creator              |                  |              |            |               |
| Name                 |         x        |       x      |      x     | x             |
| Version              |         x        |       x      |      x     |               |
| Filename             |         x        |       x      |      x     | x             |
| Dependency Hierarchy |         x        |       x      |      x     | x             |
| Associated Licenses  |         x        |       x      |      x     | x             |
| Concluded Licenses   |         x        |       x      |      x     | x             |
| Executable           |                  |              |            |               |
| Archive              |                  |              |            |               |
| Structured           |                  |              |            |               |
| Source Code URI      |                  |              |            |               |
| Deployable URI       |                  |              |            |               |
| Unique Identifiers   |         x        |       x      |      x     | x             |
| SHA-512 Hash         |                  |              |            |               |

## Section Specific Statements

### Trivy and Svyft

Regarding Trivy and Svyft, we will not make any assumptions or predictions about their 
level of compliance, as we have no insight into their operations, future development plans,
or whether they intend to align with the BSI and NTIA guidelines at all.

### Current development status


### Future development



