## Validation Results

### Validation Information

Document name: keycloak-25.0.4-spdx-3.0.1_spdx-exporter.json <br>
Spec version: 3.0.1 <br>
Creation date: Mon Oct 07 15:09:37 CEST 2024 <br>

### Manual Adjustments

No manual adjustments were made.

### Additional Remarks

Some warnings and errors are not returned through .verify() but rather logged by the JsonLDDeserializer. This seems 
to be wrong and might be due to the alpha state of the new spdx-java-library. Such warnings are not included in the 
results below at this time but have been added manually in this section.

#### JSonDeserializer Warnings
```
Non element in the serialized graph - __anon__gnrtd0 will not be included in the SPDX document elements
```

### Results
The following results were generated as described in the **Validation Process** section
of the **README.md** and filtered to remove duplicate warnings or errors.

```
Document validation returned no errors or warnings.
```
