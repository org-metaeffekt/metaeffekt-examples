#!/bin/bash
set -e

# ---------- Color definitions ----------------------------------

error="\033[0;31m[ERROR]\033[0m"
success="\033[0;32m[SUCCESS]\033[0m"
info="\033[0;34m[INFO]\033[0m"

# ---------- Prerequisites check --------------------------------

check_prerequisites() {
  echo "\n$info    Checking for necessary prerequisites"
  if ! command -v mvn &>/dev/null; then
    echo "$error Maven is not installed or not in your PATH."
    echo "       Please install Maven or add it to your PATH.\n"
    exit 1
  else
    echo "$success Prerequisite found: [Maven]"
  fi

  # Check if input file is .json or .xml
  if [[ ! "$INPUT" =~ \.(json|xml)$ ]]; then
    echo "$error Input file must have a .json or .xml extension."
    exit 1
  else
    echo "$success Valid input file format."
  fi

  # Check if output file is .xls or .xlsx
  if [[ ! "$OUTPUT" =~ \.(xls|xlsx)$ ]]; then
    echo "$error Output file must have a .xls or .xlsx extension."
    exit 1
  else
    echo "$success Valid output file format."
  fi
}

# ---------- Print help section --------------------------------

show_help() {
  cat <<EOF
#################################################################
Usage: sh $(basename "$0") <input_file> <output_file>

  <input_file>  Must be a .json or .xml file.
  <output_file> Must be a .xls or .xlsx file.

Example:
  sh $(basename "$0") bom.json inventory.xlsx
#################################################################
EOF
  exit 1
}

# --------- Beginning of main script ---------------------------

# Check if help is requested.
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
  show_help
fi

# Ensure exactly two arguments are provided.
if [[ "$#" -ne 2 ]]; then
  echo "$error Exactly two arguments are required."
  show_help
fi

INPUT="$1"
OUTPUT="$2"

clear
echo "#################################################################"
echo "########                                              ###########"
echo "########   \033[1mConverter Script: CycloneDX -> Inventory\033[0m   ###########"
echo "########             {metaeffekt} GmbH                ###########"
echo "########                                              ###########"
echo "#################################################################"

check_prerequisites

echo "#################################################################"
echo "This conversion is executed via the maven pom:"
echo "convert_cyclonedx-to-inventory.xml specified in the processors"
echo "directory of the metaeffekt-examples repository."
echo "The two configurable parameters influencing the bom conversion."
echo "process are set as follows:"
echo
echo "Parameter:   includeMetadataComponent = true"
echo "Explanation: The component contained in the metadata section of"
echo "             the bom, will be included in the result-inventory"
echo "             as an asset if it exists."
echo
echo "Parameter:   deriveAttributesFromPurl = true"
echo "Explanation: Component information not contained in the bom"
echo "             directly, which could be derived from the PURL"
echo "             if available, will be derived."
echo "#################################################################\n"

sleep 3

echo "\n#################################################################"
echo "$info Executing Maven conversion..."
echo "#################################################################\n"

mvn -f "../processors/convert_cyclonedx-to-inventory.xml" clean install \
  -Dinput="$INPUT" \
  -Doutput="$OUTPUT" \
  -DincludeMetadataComponent="true" \
  -DderiveAttributesFromPurl="true"
rm -rf target

echo "\n#################################################################"
echo "$success Converted bom to inventory located at:"
echo "          $OUTPUT"
echo "#################################################################\n"

# --------- End of main script -------------------------------
