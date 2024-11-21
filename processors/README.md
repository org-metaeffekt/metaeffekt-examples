# Processors

Processors are defined as maven poms. These allow combinations of maven executions, script execution and active
dependency resolution.

## Usage

    mvn -f <processor-pom>.xml process-resources -D<key>="<value>" ...

from the processors folder

For debugging:

    mvn -f <processor-pom>.xml process-resources -D<key>="<value>" ... -X 

## Examples

    mvn -f convert_cyclonedx-to-inventory.xml process-resources -Dinput=../keycloak-25.0.4/01-analyzed/keycloak-25.0.4-cyclone-dx-1.6_exporter.json -Doutput=../keycloak-25.0.4/03-advised/keycloak-25.0.4_input.xlsx

