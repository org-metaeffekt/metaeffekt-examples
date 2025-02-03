#!/usr/bin/env bash
#
# Script: convert-files.sh
# Description:
#   Converts CycloneDX BOM files (JSON/XML) in the "inputs" folder into an inventory.
#   It checks for Maven, ensures the "inputs" and "outputs" directories exist, scans for relevant files,
#   optionally changes default Maven parameters, and then runs the conversion.

# --- [ Color Definitions ] ---
error="\033[0;31m[ERROR]\033[0m"
success="\033[0;32m[SUCCESS]\033[0m"
info="\033[0;34m[INFO]\033[0m"

# Clear screen
clear

echo -e "#################################################################"
echo -e "########                                              ###########"
echo -e "########   \033[1mConverter Script: CycloneDX -> Inventory\033[0m   ###########"
echo -e "########             {metaeffekt} GmbH                ###########"
echo -e "########                                              ###########"
echo -e "#################################################################\n"

# Check if Maven is installed
echo -e "${info} Checking for necessary prerequisites: [Maven]"
if ! command -v mvn &>/dev/null; then
  echo -e "$error Maven is not installed or not in your PATH."
  echo -e "       Please install Maven or add it to your PATH.\n"
  exit 1
else
  echo -e "$success Prerequisite found: [Maven]\n"
fi


script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
inputs_dir="$script_dir/inputs"
outputs_dir="$script_dir/outputs"

# Ensure necessary maven poms exist.
if [[ ! -f "$script_dir/convert_cyclonedx-to-inventory.xml" ]]; then
  echo -e "$error Necessary maven pom [convert_cyclonedx-to-inventory.xml] does not exist."
  echo -e "        This should have either been provided or can optionally be downloaded at: https://github.com/org-metaeffekt/metaeffekt-examples/tree/main/processors"
    exit 1
else
  echo -e "$success Prerequisite found: [Conversion POM]\n"
fi

if [[ ! -f "$script_dir/processor-parent.xml" ]]; then
  echo -e "$error Necessary maven pom [processor-parent.xml] does not exist."
  echo -e "        This should have either been provided or can optionally be downloaded at: https://github.com/org-metaeffekt/metaeffekt-examples/tree/main/processors"
  exit 1
else
  echo -e "$success Prerequisite found: [Parent POM]\n"
fi

# Ensure 'inputs' and 'outputs' directories exist (create if needed)
if [[ ! -d "$inputs_dir" ]]; then
  echo -e "${info} Directory '$inputs_dir' does not exist. Create it? (y/n)"
  read -r create_inputs
  if [[ "$create_inputs" =~ ^[yY]$ ]]; then
    mkdir -p "$inputs_dir" || {
      echo -e "$error Could not create '$inputs_dir'"
      exit 1
    }
    echo -e "${info} Created: $inputs_dir\n"
  else
    echo -e "${info} Exiting...\n"
    exit 1
  fi
fi

if [[ ! -d "$outputs_dir" ]]; then
  echo -e "${info} Directory '$outputs_dir' does not exist. Create it? (y/n)"
  read -r create_outputs
  if [[ "$create_outputs" =~ ^[yY]$ ]]; then
    mkdir -p "$outputs_dir" || {
      echo -e "$error Could not create '$outputs_dir'"
      exit 1
    }
    echo -e "${info} Created: $outputs_dir\n"
  else
    echo -e "${info} Exiting...\n"
    exit 1
  fi
fi

# Scan 'inputs' for .json or .xml files
shopt -s nullglob  # so that an empty match yields an empty array
json_files=("$inputs_dir"/*.json)
xml_files=("$inputs_dir"/*.xml)
files_to_convert=("${json_files[@]}" "${xml_files[@]}")

if [[ ${#files_to_convert[@]} -eq 0 ]]; then
  echo -e "$error No .json or .xml files found in '$inputs_dir'."
  echo -e "       Please place files in '$inputs_dir' and re-run the script.\n"
  exit 0
fi

echo -e "${info} Found the following files to convert:"
for f in "${files_to_convert[@]}"; do
  echo -e "       - $f"
done
echo

# Ask if user wants to change default params
default_includeMetadataComponent="true"
default_deriveAttributesFromPurl="true"

echo -e "${info} Default Maven conversion parameters:"
echo -e "       includeMetadataComponent: $default_includeMetadataComponent"
echo -e "       deriveAttributesFromPurl: $default_deriveAttributesFromPurl\n"

echo -e "Would you like to change these defaults? (y/n)"
read -r change_defaults

if [[ "$change_defaults" =~ ^[yY]$ ]]; then
  read -r -p "Include metadata component? (true/false) [current: $default_includeMetadataComponent]: " user_includeMetadata
  read -r -p "Derive attributes from PURL? (true/false) [current: $default_deriveAttributesFromPurl]: " user_deriveFromPurl

  # If user leaves any blank, retain the default
  if [[ -n "$user_includeMetadata" ]]; then
    default_includeMetadataComponent="$user_includeMetadata"
  fi
  if [[ -n "$user_deriveFromPurl" ]]; then
    default_deriveAttributesFromPurl="$user_deriveFromPurl"
  fi
fi

echo -e "${info} Final parameters to be used:"
echo -e "       input:                    $inputs_dir"
echo -e "       output:                   $outputs_dir"
echo -e "       includeMetadataComponent: $default_includeMetadataComponent"
echo -e "       deriveAttributesFromPurl: $default_deriveAttributesFromPurl\n"

sleep 2

# Execute Maven with the POM
echo -e "${info} Executing Maven conversion..."
mvn -f "$script_dir/convert_cyclonedx-to-inventory.xml" clean install \
  -Dinput="$inputs_dir" \
  -Doutput="$outputs_dir" \
  -DincludeMetadataComponent="$default_includeMetadataComponent" \
  -DderiveAttributesFromPurl="$default_deriveAttributesFromPurl"

rm -rf target

# Check Maven exit code
maven_exit_code=$?
if [[ $maven_exit_code -ne 0 ]]; then
  echo -e "$error Maven conversion failed with exit code $maven_exit_code.\n"
  exit $maven_exit_code
else
  echo -e "$success Conversion completed successfully!"
  echo -e "          Converted files should be in '$outputs_dir'.\n"
fi
