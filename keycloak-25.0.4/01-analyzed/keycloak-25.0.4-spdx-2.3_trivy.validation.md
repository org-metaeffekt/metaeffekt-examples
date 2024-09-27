## Validation Results

## Remark

Document could not be validated:

org.spdx.library.InvalidSPDXAnalysisException: Duplicate SPDX ID: SPDXRef-File-e00fe45d7784975a
org.spdx.library.InvalidSPDXAnalysisException: Duplicate SPDX ID: SPDXRef-File-56b1f84d8298682c
org.spdx.library.InvalidSPDXAnalysisException: Duplicate SPDX ID: SPDXRef-File-88bb9984184d14cd
org.spdx.library.InvalidSPDXAnalysisException: Duplicate SPDX ID: SPDXRef-File-135578890ab7a863
org.spdx.library.InvalidSPDXAnalysisException: Duplicate SPDX ID: SPDXRef-File-ff37d5a1cc9e4de2
org.spdx.library.InvalidSPDXAnalysisException: Duplicate SPDX ID: SPDXRef-File-591aacc7a6aa057
org.spdx.library.InvalidSPDXAnalysisException: Duplicate SPDX ID: SPDXRef-File-a2686a1467401f47
org.spdx.library.InvalidSPDXAnalysisException: Duplicate SPDX ID: SPDXRef-File-b0d92fc13e9733c6

This is due to duplication of files in the document with the same content. E.g.:

```json
{
  "fileName": "opt/keycloak/bin/client/keycloak-admin-cli-25.0.4.jar",
  "SPDXID": "SPDXRef-File-e00fe45d7784975a",
  "checksums": [
    {
      "algorithm": "SHA1",
      "checksumValue": "2f9b3370927604e7c91ecbca5b654697ae9d4046"
    }
  ],
  "copyrightText": ""
}
```    

## Corrected SPDX Validation Results

The validation results have been produced for the manually corrected file

`keycloak-25.0.4-spdx-2.3_trivy_corrected.json`

Validation errors and warnings (spdx-java validation for 2.3):

```
Relationship error: Invalid license id 'ASL-1.1'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in java-21-openjdk-headless in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'ASL-2.0'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in java-21-openjdk-headless in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'Boost'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in zlib in sqlite-libs in sqlite-libs in nss-softokn in nss-softokn in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'GFDL'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'GFDL'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in glibc-common in glibc in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'GFDL'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in glibc-langpack-en in glibc in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'Inner-Net'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'Inner-Net'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in glibc-common in glibc in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'Inner-Net'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in glibc-langpack-en in glibc in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'LGPLv2'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'LGPLv2'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in glibc-common in glibc in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'LGPLv2'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in glibc-langpack-en in glibc in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'LGPLv2'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in java-21-openjdk-headless in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'LGPLv2'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in libacl in coreutils-single in coreutils-single in ca-certificates in ca-certificates in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'LGPLv2'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in libattr in coreutils-single in coreutils-single in ca-certificates in ca-certificates in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'LGPLv2'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in libgcc in glibc in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'LGPLv2'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in libsepol in libselinux in libselinux in coreutils-single in coreutils-single in ca-certificates in ca-certificates in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'LGPLv2'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in libtasn1 in p11-kit-trust in p11-kit-trust in ca-certificates in ca-certificates in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'LGPLv2'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in lksctp-tools in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'MPLv2.0'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in java-21-openjdk-headless in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'MPLv2.0'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in nspr in nss-softokn in nss-softokn in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'MPLv2.0'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in nss in java-21-openjdk-headless in java-21-openjdk-headless in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'MPLv2.0'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in nss-softokn in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'MPLv2.0'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in nss-softokn-freebl in nss-softokn in nss-softokn in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'MPLv2.0'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in nss-sysinit in nss in nss in java-21-openjdk-headless in java-21-openjdk-headless in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'MPLv2.0'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in nss-util in nss-softokn-freebl in nss-softokn-freebl in nss-softokn in nss-softokn in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Invalid license id 'RSA'.  Must start with 'LicenseRef-' and made up of the characters from the set 'a'-'z', 'A'-'Z', '0'-'9', '+', '_', '.', and '-'. in java-21-openjdk-headless in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for ASL-1.1 in java-21-openjdk-headless in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for ASL-2.0 in java-21-openjdk-headless in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for Boost in zlib in sqlite-libs in sqlite-libs in nss-softokn in nss-softokn in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for GFDL in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for GFDL in glibc-common in glibc in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for GFDL in glibc-langpack-en in glibc in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for Inner-Net in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for Inner-Net in glibc-common in glibc in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for Inner-Net in glibc-langpack-en in glibc in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for LGPLv2 in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for LGPLv2 in glibc-common in glibc in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for LGPLv2 in glibc-langpack-en in glibc in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for LGPLv2 in java-21-openjdk-headless in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for LGPLv2 in libacl in coreutils-single in coreutils-single in ca-certificates in ca-certificates in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for LGPLv2 in libattr in coreutils-single in coreutils-single in ca-certificates in ca-certificates in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for LGPLv2 in libgcc in glibc in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for LGPLv2 in libsepol in libselinux in libselinux in coreutils-single in coreutils-single in ca-certificates in ca-certificates in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for LGPLv2 in libtasn1 in p11-kit-trust in p11-kit-trust in ca-certificates in ca-certificates in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for LGPLv2 in lksctp-tools in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for MPLv2.0 in java-21-openjdk-headless in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for MPLv2.0 in nspr in nss-softokn in nss-softokn in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for MPLv2.0 in nss in java-21-openjdk-headless in java-21-openjdk-headless in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for MPLv2.0 in nss-softokn in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for MPLv2.0 in nss-softokn-freebl in nss-softokn in nss-softokn in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for MPLv2.0 in nss-sysinit in nss in nss in java-21-openjdk-headless in java-21-openjdk-headless in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for MPLv2.0 in nss-util in nss-softokn-freebl in nss-softokn-freebl in nss-softokn in nss-softokn in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: License not found for RSA in java-21-openjdk-headless in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Missing required exception name in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Missing required exception name in glibc-common in glibc in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Missing required exception name in glibc-langpack-en in glibc in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Missing required exception name in java-21-openjdk-headless in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Missing required exception name in libgcc in glibc in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Missing required exception text for advertising in java-21-openjdk-headless in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Missing required exception text for exceptions in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Missing required exception text for exceptions in glibc-common in glibc in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Missing required exception text for exceptions in glibc-langpack-en in glibc in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Missing required exception text for exceptions in java-21-openjdk-headless in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
Relationship error: Missing required exception text for exceptions in libgcc in glibc in glibc in redhat in redhat in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4 in quay.io/keycloak/keycloak:25.0.4
```
