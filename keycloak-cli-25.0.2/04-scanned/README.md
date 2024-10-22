# Scanned

This folder shows the results from passing inventories through our scanner. The scanner tries to expand each 
artifact with its respective applicable licenses and copyrights. Licenses are analyzed to gather derived/effective 
licenses for each artifact.

## Observations and TODOs

### General
- License aggregation has to be improved as there are still more artifacts with unidentified licenses as we would like.
- Provide comment as to why assets don't have licenses attached, differentiate between assets and artifacts in SBOM for
  better understanding.
- License-Texts are still missing for many licenses externally referenced.

### SPDX-3.0.1-Exporter
- Relationships section is very bloated since relationships can only be ONE --> MANY while license relationships 
  also require MANY --> ONE relationships as many packages can have the same licenses attached.
- License expressions are not checked for redundancy when not exactly equal. E.g. (A AND B),(B AND A) have the exact 
  same meaning, so they don't both need to be listed.

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
