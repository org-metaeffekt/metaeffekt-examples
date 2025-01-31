# Pipelines

## Actions

The actions directory contains simple modular tasks, also known as custom composite actions. These are used to build bigger
workflows which require more steps and implement complex behaviour.

Resources required by the action or its underlying pom, are put into the folder containing the action for easy comprehension.
The directory structure follows the same structure as each described asset in this repository. 

## Workflows

## Trying it out

To try out these workflows locally you can use the **act** cli which can be found here:
https://github.com/nektos/act

If running these pipelines locally using the **act** cli, run the following command from the root directory of this
repository. If not run from the root directory **act** might not recognize the relative paths present in the workflows.

~~~
cd [...]/metaeffekt-examples/
act -W '.github/workflows/<WORKFLOW-FILE.yml>'
~~~