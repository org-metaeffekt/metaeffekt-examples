# Identified

This folder shows results from different tools capturing the identified software assets in the given container image.

## Observations and TODOs

### keycloak-25.0.4-spdx-2.3_spdx-exporter_current.json
- do not insert generic PURLs; if the purl is yet unknown, omit it.
- run through spdx-java validator and provide result
- include fileName on package-level (relative path)
- consider plain name as name or <groupid>:<artifactId> (what about classifiers?); consider full maven notation for jars
  (identifies the file uniquely; competes with PURL)
 
### keycloak-25.0.4-spdx-2.3_spdx-exporter_new.json
- see keycloak-25.0.4-spdx-2.3_spdx-exporter_current.json
- ensure the new feature branch produces the same or better results; no degradation using the latest spdx-java libraries
- run through spdx-java validator and provide result

### keycloak-25.0.4-spdx-2.3_syft.json

```bash
./syft quay.io/keycloak/keycloak:25.0.4 -o spdx-json | json_pp > keycloak-25.0.4-spdx-2.3_syft.json
```

- run through spdx-java validator and provide result
- some checksums are corrupt showing 0000000000000000000000000000000000000000; verify / understand
- missing artifacts (jars without version):
  - generated-bytecode.jar
  - transformed-bytecode.jar
- license expressions are captured as license the expression being the license text (not as expected)
- only uses SHA-1 hashes
- produces artificial CPEs; hopefully some of these are a fit
- syft also reports files that could not be matched to a packages/component; some of them regarded covered by packages
  - e.g. usr/share/terminfo/E/Eterm covered by ncurses-base-6.2

### keycloak-25.0.4-spdx-2.3_trivy.json

```bash
trivy image --scanners vuln --format spdx-json --output keycloak-25.0.4-spdx-2.3_trivy.json quay.io/keycloak/keycloak:25.0.4
```

- run through spdx-java validator and provide result
- interesting use of "attributionTexts" in the different elements; is this expected?
- interesting use of sourceInfo for embedded files.
- choice of package name (no included version; not the filename)
- empty string as copyright text
- missing artifacts (jars without version):
    - generated-bytecode.jar
    - keycloak.jar
    - quarkus-run.jar
    - transformed-bytecode.jar
- some licenses / license expression are not SPDX conforming or use deprecated/unknown identifiers
  - "LGPLv2+ AND LGPLv2+ WITH exceptions AND GPL-2.0-or-later AND GPL-2.0-or-later WITH exceptions AND BSD-3-Clause AND Inner-Net AND ISC AND Unlicense AND GFDL"
- only uses MD5 checksums

## Further Details to be added
- export CycloneDX files using the different tools
- run validation on the SPDX docs and provide results
- optional: produce diffs of the given results