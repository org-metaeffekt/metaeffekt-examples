# Analyzed

This folder shows results from different tools capturing the identified software assets in the given container image.
It also includes the corresponding validation.txt files which contain the results of verifying the integrity of 
the document through the use of the spdx-java-library.

## Observations and TODOs

### keycloak-25.0.4-spdx-2.3_spdx-exporter_current.json
- do not insert generic PURLs; if the purl is yet unknown, omit it.
- include fileName on package-level (relative path)
- consider plain name as name or <groupid>:<artifactId> (what about classifiers?); consider full maven notation for jars
  (identifies the file uniquely; competes with PURL)
 
### keycloak-25.0.4-spdx-2.3_spdx-exporter_new.json
- see keycloak-25.0.4-spdx-2.3_spdx-exporter_current.json
- ensure the new feature branch produces the same or better results; no degradation using the latest spdx-java libraries

### keycloak-25.0.4-spdx-2.3_syft.json

```bash
./syft quay.io/keycloak/keycloak:25.0.4 -o spdx-json | json_pp > keycloak-25.0.4-spdx-2.3_syft.json
```

- some checksums are corrupt showing 0000000000000000000000000000000000000000; verify / understand
- missing artifacts (jars without version):
  - generated-bytecode.jar
  - transformed-bytecode.jar
- license expressions are captured as license the expression being the license text (not as intended/expected)
- produces artificial CPEs; hopefully some of these are a fit; not recommended
- syft also reports files that could not be matched to a packages/component; some of them are regarded covered by the 
  identified packages
  - e.g. 'usr/share/terminfo/E/Eterm' is covered by ncurses-base-6.2

### keycloak-25.0.4-spdx-2.3_trivy.json

```bash
trivy image --scanners vuln --format spdx-json --output keycloak-25.0.4-spdx-2.3_trivy.json quay.io/keycloak/keycloak:25.0.4
```

- interesting use of "attributionTexts" in the different elements; is this the intended use?
- interesting use of sourceInfo for embedded files; inherit for SPDX Exporter
- choice of package name (no included version; not the filename)
- empty string as copyright text (not as intended)
- missing artifacts (jars without version):
    - generated-bytecode.jar
    - quarkus-run.jar
    - transformed-bytecode.jar
- some licenses / license expression are not SPDX conforming or use deprecated/unknown identifiers
  - "LGPLv2+ AND LGPLv2+ WITH exceptions AND GPL-2.0-or-later AND GPL-2.0-or-later WITH exceptions AND BSD-3-Clause AND Inner-Net AND ISC AND Unlicense AND GFDL"
- sometimes only provides MD5 or SHA1 checksums

## Further Details to be added
- export CycloneDX files using the different tools
- also include scnacode extractcode results
- optional: produce diffs of the given results