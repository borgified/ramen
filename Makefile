# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## help menu
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

setup: ## setup vagrant workers
	./vagrant_setup.sh

clean: ## destroy vagrant workers
	./vagrant_cleanup.sh

up: ## bring up jenkins (extract jenkins_plugins.tar.gz into jenkins_home/plugins && tf apply)
	mkdir jenkins_home
	tar xfz jenkins_plugins.tar.gz --strip=2 -C jenkins_home
	terraform apply -auto-approve
	echo "waiting for jenkins to start" && sleep 60
	cat jenkins_home/secrets/initialAdminPassword

reset_plugins: ## rm jenkins_home, mkdir jenkins_home, untar jenkins_plugins
	rm -rf jenkins_home
	mkdir jenkins_home
	tar xfz jenkins_plugins.tar.gz --strip=2 -C jenkins_home


jenkins_image = "quay.io/optimizely/jenkins:2.131-slim"

manual: reset_plugins ## bring up jenkins manually
	docker pull $(jenkins_image)
	docker run -d -v ${PWD}/jenkins_home:/var/jenkins_home -p 8080:8080 $(jenkins_image)
