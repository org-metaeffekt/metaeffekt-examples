# Analyzed

This folder shows results from different tools capturing the identified software assets from a given POM file.
It also includes the corresponding validation.md files which contain the results of verifying the integrity of
the document through the use of the spdx-java-library.

## Observations and TODOs

### General

- Archive, Structured and Executable properties should already be present in inventory and not added via 
  preprocessing before exporting.
- SHA512 is still not present in the inventory, might be because of scarce availability.

### SPDX-Exporter Current
- SPDX-IDs should maybe have a prefix instead of only SPDXRef-gnrtd(X)

### SPDX-Exporter New
- SPDX-IDs should maybe have a prefix instead of only SPDXRef-gnrtd(X)
- Improve PURL handling for the new SPDX-Exporter branch

### SPDX-3.0.1-Exporter
- Improve PURL handling for the new SPDX-Exporter branch
- IDs are very long because of prefixes
- Bring 3.0.1 up to speed, implement features missing in comparison to 2.3-New/Current



## Validation Process

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
