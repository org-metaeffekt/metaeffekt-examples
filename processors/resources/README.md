# Processor Resources

This directory includes additional resources which may be required for certain maven plugin executions and/or other
operations executed in this repository. The use of these resources is either self-explanatory when viewed in conjunction
with the maven pom they are used in or not deemed "important enough" for further explanation. Any more abstract or hard-to-understand
resources requiring explanation are listed below.

## Reported

Additional information on the resources used for the "reported" stage of the pipeline.

### Asset descriptor

The asset descriptor YAML files are used to generate various types of reports. They contain input and output parameters
as well as various configuration options with which to influence the control-flow of the report generation process.
The asset descriptors used in this repository do not contain all possible configuration options and are quite rudimentary,
only containing necessary information and retaining readability and an easier understanding of how these descriptors work.

## Resolved

Additional information on the resources used for the "resolved" stage of the pipeline.

### Resolver config and proxy

The resolver config and proxy YAML files are used to resolve inventory information. The config file contains parameters and
information for the resolver, telling it where to look for information on the artifact and assets contained in the input inventory.
The proxy file simply defines a proxy, sometimes necessary for deployment, depending on the network environment.

## Scanned

Additional information on the resources used for the "scanned" stage of the pipeline.

### Scan control properties

The scan control properties file contains parameters which influence the scanning behaviour. It can be used to activate or
deactivate stages of the scanning process as well as set certain flags controlling how information is handled.



