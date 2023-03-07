<img src="https://github.com/dbmi-bgm/cgap-pipeline/blob/master/docs/images/cgap_logo.png" width="200" align="right">

# CGAP Pipeline Main

This is the main repository for the CGAP bioinformatics pipelines.

## Documentation

Documentation for all the pipelines can now be found here:
https://cgap-pipeline-main.readthedocs.io/en/latest/.

## Initialize the Repository

Clone the main pipeline repository.
The submodules will be empty and set to the current commits saved for the main branch.

        git clone https://github.com/dbmi-bgm/cgap-pipeline-main.git

Check out the desired version.
This will set the submodules to the commits linked for that specific release.

        git checkout <version>

Download the content for each submodule.
The submodules will be set in detached state.

        make pull

Build pipeline_utils (optional).
This will build from source the latest version linked for that specific release.

        make configure
        make update
        make build

## Deploy the Pipelines

Set the credentials to authenticate to the target environment. A minimal set of credentials is required and can be defined in the `.env` file. Additional credentials can be required to authenticate to the environment, see [*here*](https://cgap-pipeline-utils.readthedocs.io/en/latest/deploy_pipeline.html#set-up-credentials-and-environmental-variables) for more details.

Test the deployment using the base module only.

        make deploy-base

Deploy all the other modules.

        makde deploy-all
