# Pipelines

## Developer Information

If running these pipelines locally using the **act** cli, run the following command from the root directory of this
repository. If not run from the root directory **act** might not recognize the relative paths present in the workflows.

~~~
cd [...]/metaeffekt-examples/
act -W '.github/workflows/pipelines/<WORKFLOW-FILE.yml>'
~~~