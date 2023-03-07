include .env
export

pull:
	git submodule init
	git submodule update

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
			.

info:
	@: $(info Here are some 'make' options:)
	   $(info - Use 'make pull' to initialize/pull the submodules.)
	   $(info - Use 'make deploy-all' to deploy all the available pipelines. Expect pipeline_utils to be installed.)
