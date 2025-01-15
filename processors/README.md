# Processors

Processors are defined as maven poms. These allow combinations of maven executions, script execution and active
dependency resolution.

## Usage

If maven is already installed on the system, the pom files can be executed as follows.

~~~
cd [...]/metaeffekt-examples/processors
mvn -f [pom-file.xml] process-resources -D[parameter-name]=[parameter-value] -D[parameter-2-name]=[parameter-2-value]
~~~

It should be noted that paths always have to be relative to the pom.xml file. For example:

~~~
mvn -f convert_cyclonedx-to-inventory.xml process-resources -Dinput=../keycloak-25.0.4/01-analyzed/keycloak-25.0.4-cyclone-dx-1.6_exporter.json -Doutput=../keycloak-25.0.4/03-advised/keycloak-25.0.4_input.xlsx
~~~

## Detailed explanation

The maven poms follow a similar naming convention as the rest of the repository. Each pom file starts with the pipeline step for
which it produces results while the rest of the name describes which action it performs. It should be noted that
some poms do not have a pipeline-step associated with them.

Parameters which are present in a pom but not listed in the parameter tables below can be ignored, as they
are pre-defined in the pom or deemed not necessary.

### Processor Parent

Referenced by all other poms in this repository. Defines some simple maven parameters such as
group id and version information.

### (Analyzed) Extract from container

Used to extract artifacts and assets from a container image and analyze them,
subsequently writing them to an inventory.

| Property            | Required | Explanation                                                                   |
|---------------------|----------|-------------------------------------------------------------------------------|
| image.registry      | yes      | The Docker registry where the image is located.                               |
| image.repo          | yes      | The repository or namespace within the registry.                              |
| image.tag           | yes      | The version or specific tag of the Docker image.                              |
| targetInventoryDir  | yes      | The directory in which to write the target inventory.                         |
| targetInventoryPath | yes      | The exact path of the inventory file.                                         |
| scanIncludes        | no       | Container directories which should explicitly be included.                    |
| scanExcludes        | no       | Container directories which should explicitly be excluded.                    |
| sourceInventoryDir  | yes      | Inventory directory which contains known widely used artifacts.               |
| sourceInventoryPath | yes      | Exact inventory path of the source inventory.                                 |
| failOn*             | no       | Flags to influence if the extraction should fail on meeting certain criteria. |

### (Resolved) Inventory Resolved

Used to resolve all artifacts contained in an inventory and gather additional information on those
artifacts.

| Property               | Required | Explanation                                                   |
|------------------------|----------|---------------------------------------------------------------|
| inputFile              | yes      | The input file path of the inventory which is to be resolved. |
| outputFile             | yes      | The output file path of the resolved inventory.               |
| downloadBaseDir        | no       | Download directory of the maven repo index.                   |
| artifactResolverConfig | yes      | Yaml file containing config options for the resolver.         |
| artifactResolverProxy  | yes      | Yaml file containing proxy information for the resolver.      |

### (Advised) Enrich Inventories

Takes a resolved inventory and enriches it with vulnerability information.



### (Advised) Create Dashboard

Creates a vulnerability assessment dashboard from an enriched inventory.

| Property                                    | Required | Explanation                                                                                                     |
|---------------------------------------------|----------|-----------------------------------------------------------------------------------------------------------------|
| input.inventory                             | yes      | The enriched input inventory file path.                                                                         |
| output.dashboard                            | yes      | The vulnerability assessment dashboard output file path.                                                        |
| activate.dashboard                          | yes      | Switch to decide if a dashboard is generated.                                                                   |
| ae.dashboard.timeline                       | no       | Switch to decide whether a version timeline for artifacts is generated listing all vulnerabilities per version. |
| ae.dashboard.timeline.vulnerabilities.limit | no       | Limits the amount of vulnerabilities per timeline.                                                              |

### (Reported) Create Report

Creates a pdf report out of either an advised/enriched inventory, scanned inventory or both. The report contains
information on vulnerabilities, licenses and copyrights in a readable, user-friendly format.

| Property            | Required | Explanation                                                                                      |
|---------------------|----------|--------------------------------------------------------------------------------------------------|
| assetDescriptorFile | yes      | The asset descriptor file containing all configuration parameters required to generate a report. |
| targetReportDir     | yes      | The target directory in which to generate the pdf report.                                        |

### (Scanned) Inventory Scanner

Scans a resolved inventory for licenses and copyrights and writes the resulting information to an inventory.

| Property        | Required | Explanation                                                                                                                    |
|-----------------|----------|--------------------------------------------------------------------------------------------------------------------------------|
| inputInventory  | yes      | The resolved input inventory file path.                                                                                        |
| targetFile      | yes      | The scanned output inventory file path.                                                                                        |
| analysisBaseDir | yes      | The directory in which the scanner caches information on artifacts. Increases speed drastically between multiple scanner runs. |
| propertiesFile  | yes      | Yaml file containing properties to configure the scanners behaviour.                                                           |

### (Convert) Inventory to CycloneDx

Used to convert an inventory into a cyclonedx bom in either xml or json format.

| Property                   | Required | Explanation                                                              |
|----------------------------|----------|--------------------------------------------------------------------------|
| input                      | yes      | The input inventory file path from which to generate the bom.            |
| output                     | yes      | The output bom file path with the correct format extension.              |
| documentName               | yes      | The document name listed in the bom.                                     |
| description                | no       | The document description listed in the bom.                              |
| documentIdPrefix           | yes      | Id prefix used for every component.                                      |
| organization               | yes      | The organization which created the bom.                                  |
| organizationUrl            | yes      | The url of the organization which created the bom.                       |
| person                     | no       | The person which created the bom.                                        |
| comment                    | no       | A comment regarding the creation of the bom.                             |
| spdxLicenseListVersion     | no       | Which version of the spdx license list to use when creating the bom.     |
| outputFormat               | no       | Which output format the bom should be in. (Default JSON)                 |
| documentVersion            | no       | The current version of this bom.                                         |
| mapRelationships           | no       | If relationships between inventory artifacts should be tracked.          |
| useLicenseExpressions      | no       | If license expressions or single licenses should be used.                |
| includeLicenseTexts        | no       | If license texts should be included.                                     |
| includeAssets              | no       | If only artifacts should be included or assets as well.                  |
| includeTechnicalProperties | no       | Only required to mitigate data-loss for multiple import/export cycles.   |
| bomVersion                 | no       | CycloneDx version of the bom.                                            |
| approvedAttributes         | no       | A json file containing an array of attributes to be explicitly exported. |

### (Convert) Inventory to Spdx

Used to convert an inventory into a spdx bom in either xml or json format.

| Property                   | Required | Explanation                                                              |
|----------------------------|----------|--------------------------------------------------------------------------|
| input                      | yes      | The input inventory file path from which to generate the bom.            |
| output                     | yes      | The output bom file path with the correct format extension.              |
| documentName               | yes      | The document name listed in the bom.                                     |
| tool                       | yes      | The tool with witch the bom was generated.                               |
| description                | no       | The document description listed in the bom.                              |
| documentIdPrefix           | yes      | Id prefix used for every component.                                      |
| organization               | yes      | The organization which created the bom.                                  |
| organizationUrl            | yes      | The url of the organization which created the bom.                       |
| person                     | no       | The person which created the bom.                                        |
| comment                    | no       | A comment regarding the creation of the bom.                             |
| spdxLicenseListVersion     | no       | Which version of the spdx license list to use when creating the bom.     |
| outputFormat               | no       | Which output format the bom should be in. (Default JSON)                 |
| documentVersion            | no       | The current version of this bom.                                         |
| mapRelationships           | no       | If relationships between inventory artifacts should be tracked.          |
| useLicenseExpressions      | no       | If license expressions or single licenses should be used.                |
| includeLicenseTexts        | no       | If license texts should be included.                                     |
| includeAssets              | no       | If only artifacts should be included or assets as well.                  |
| includeTechnicalProperties | no       | Only required to mitigate data-loss for multiple import/export cycles.   |
| customLicenseMappings      | no       | A json file containing a map of custom license mappings.                 |
| approvedAttributes         | no       | A json file containing an array of attributes to be explicitly exported. |

### (Convert) CycloneDx to Inventory

Used to convert a cyclonedx document into an inventory.

| Property                 | Required | Explanation                                                    |
|--------------------------|----------|----------------------------------------------------------------|
| input                    | yes      | The input inventory file path from which to generate the bom.  |
| output                   | yes      | The output bom file path with the correct format extension.    |
| includeMetadataComponent | no       | If the cyclonedx component under metadata should be included . |

