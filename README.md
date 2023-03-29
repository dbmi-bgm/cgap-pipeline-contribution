<img src="https://github.com/dbmi-bgm/cgap-pipeline/blob/master/docs/images/cgap_logo.png" width="200" align="right">

# CGAP Pipeline Contribution

This repository contains modules contribued to CGAP pipelines through external collaborations.

## Documentation

Documentation for the standard CGAP pipelines can be found here:
https://cgap-pipeline-main.readthedocs.io/en/latest/.

## Initialize the Repository

Clone the repository.
The submodules will be empty and set to the current commits saved for the main branch.

        git clone https://github.com/dbmi-bgm/cgap-pipeline-contribution.git

Check out the desired version.
This will set the submodules to the commits linked for that specific release.

        git checkout <version>

Download the content for each submodule.
The submodules will be set in detached state.

        make pull

## Deployment Requirements

In order to deploy the pipelines `pipeline_utils` need to be installed and available in the environment.
Please refer to the corresponding documentation here: https://portal-pipeline-utils.readthedocs.io/en/latest/.

The software can also be automatically installed through our main pipeline repository, here: https://github.com/dbmi-bgm/cgap-pipeline-main.

Before deploying modules from this repository it is necessary to deploy the `cgap-pipeline-base` module from the main pipeline repository.
Please refer to the corresponding documentation in the repository.

## Deploy the Pipelines

Set the credentials to authenticate to the target environment. A minimal set of credentials is required and can be defined in the `.env` file. Additional credentials can be required to authenticate to the environment, see [*here*](https://portal-pipeline-utils.readthedocs.io/en/latest/deploy_pipeline.html#set-up-credentials-and-environmental-variables) for more details.

Deploy all the modules.

        make deploy-all
