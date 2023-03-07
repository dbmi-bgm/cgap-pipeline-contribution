include .env
export

.PHONY: build

configure:
	pip install --upgrade pip
	pip install poetry

pull:
	git submodule init
	git submodule update

update:
	poetry update

build:
	poetry install

build-image:
	docker build base_images/ubuntu-py-generic -t cgap-ubuntu2004-py-38

build-image-37:
	docker build base_images/ubuntu-py-generic --build-arg PYTHON_VERSION=3.7 -t cgap-ubuntu2004-py-37

deploy-base:
	scripts/check_awscred.sh
	poetry run pipeline_utils pipeline_deploy \
		--ff-env ${ENV_NAME} \
		--keydicts-json ${KEYDICTS_JSON} \
		--wfl-bucket ${WFL_BUCKET} \
		--account ${AWS_ACCOUNT_NUMBER} \
		--region ${AWS_DEFAULT_REGION} \
		--project ${PROJECT} \
		--institution ${INSTITUTION} \
		--sentieon-server ${SENTIEON_LICENSE} \
		--post-software \
		--post-file-format \
		--post-file-reference \
		--post-workflow \
		--post-metaworkflow \
		--post-wfl \
		--post-ecr \
		--repos \
			cgap-pipeline-base

deploy-all:
	scripts/check_awscred.sh
	poetry run pipeline_utils pipeline_deploy \
		--ff-env ${ENV_NAME} \
		--keydicts-json ${KEYDICTS_JSON} \
		--wfl-bucket ${WFL_BUCKET} \
		--account ${AWS_ACCOUNT_NUMBER} \
		--region ${AWS_DEFAULT_REGION} \
		--project ${PROJECT} \
		--institution ${INSTITUTION} \
		--sentieon-server ${SENTIEON_LICENSE} \
		--post-software \
		--post-file-format \
		--post-file-reference \
		--post-workflow \
		--post-metaworkflow \
		--post-wfl \
		--post-ecr \
		--repos \
			cgap-pipeline-base \
			cgap-pipeline-upstream-GATK \
			cgap-pipeline-upstream-sentieon \
			cgap-pipeline-SNV-germline \
			cgap-pipeline-SV-germline \
			cgap-pipeline-SNV-somatic \
			cgap-pipeline-SV-somatic \
			cgap-pipeline-somatic-sentieon \
			.

info:
	@: $(info Here are some 'make' options:)
	   $(info - Use 'make configure' to configure the repo by installing poetry.)
	   $(info - Use 'make pull' to initialize/pull the submodules.)
	   $(info - Use 'make update' to update dependencies and the lock file.)
	   $(info - Use 'make build' to install entry point commands.)
	   $(info - Use 'make deploy-all' to deploy all the available pipelines.)
	   $(info - Use 'make build-image' to build the base Docker image for pipeline images with Python 3.8.)
	   $(info - Use 'make build-image-37' to build the base Docker image for pipeline images with Python 3.7.)
