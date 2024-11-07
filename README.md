# metaeffekt-examples

Repository providing examples on SCA results, SBOM exports and concluded reports.

The examples are meant to create a common understanding regarding SBOM content, SBOM validation and SBOM-centric use 
cases.

## License

The examples and related content provided by {metæffekt} is licensed under [Creative Commons BY-4.0](LICENSE) if not 
specified otherwise.

Copyright © metaeffekt GmbH 2021-2024. All rights reserved.

The different examples may contain different data licenses for the conveyed content. E.g. SPDX documents are usually 
distributed under CC0-1.0.

## Disclaimer

This is all work in progress and subject to continuous improvement.

No information in this repository is meant to offend or criticize. The content is rather indented to foster 
collaboration and harmonization of the tools we apply. Not at least we identify and communicate challenges to be tackled.

All company names, organization names, license names, and product names mentioned in this repository are used for 
identification purposes only.

## Contributions

Feel free to contribute. The general agreement is that your contribution must be either under Creative Commons BY-4.0 
(CC-BY-4.0) or Creative Commons Zero 1.0 (CC0-1.0).

Commits require sign-off.

## Evaluation Process

The example structure follows a baseline pipeline:

![Basic Pipeline](docs/basic-pipeline.png)

Each example will provide the following (or a subset) of folders to collect various data
on the different stages.

### 01-analyzed

The software asset is analyzed applying different tools; the results are gathered.
This step only covers a pure identification of software components, as far as the used
tools support this objective.

### 02-resolved

The inventory with identified software is passed trought a resolver to expand
the details for each identified artifact. The extended SBOMs are gathered.

### 03-advised

The resolved inventory is run through an advisor to add vulnerability and advisory
details.

### 04_scanned

The resolved inventory and the collected representations for each artifact are
scanned for licenses and copyrights.

### 05_reported

The scanned inventory and the advised inventory are used as input for different reports.

## SBOM Validation

Simple code to reproduce the validation output:

### Spdx 2.3
```java
final File file = new File("keycloak-25.0.4-spdx-2.3_spdx-exporter_current.json");
final SpdxDocument spdxDocument = SpdxToolsHelper.deserializeDocument(file);
final List<String> verify = spdxDocument.verify("2.3");
verify.forEach(System.out::println);
```

### Spdx 3.0.1
```java
final File file = new File("keycloak-25.0.4-spdx-3.0.1_spdx-exporter.json");
final SpdxDocument spdxDocument = SpdxToolsHelper.deserializeDocument(file);
final List<String> verify = spdxDocument.verify("3.0.1");
verify.forEach(System.out::println);
```

### CycloneDX
```java
final File file = new File("keycloak-25.0.4-cyclone-dx-1.6_exporter.json");
List<String> results = new ArrayList<>();
results.addAll(
        new JsonParser()
        .validate(bomFile).stream().map(Throwable::getMessage)
        .collect(Collectors.toList()));
results.forEach(System.out::println);
```

### sbomqs

Github actions produce sbomqs results for each SPDX and CycloneDX JSON file in the repository.
