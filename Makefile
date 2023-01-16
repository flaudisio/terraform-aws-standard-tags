DEFAULT_BRANCH := main

GO_TEST_TIMEOUT ?= 30m

.PHONY: help
help:  ## Show available commands
	@echo "Available commands:"
	@echo
	@sed -n -E -e 's|^([A-Za-z0-9/_-]+):.+## (.+)|\1@\2|p' $(MAKEFILE_LIST) | column -s '@' -t

.PHONY: lint
lint:  ## Run lint commands
	pre-commit run --all-files --verbose --show-diff-on-failure --color always

.PHONY: fmt
fmt:  ## Format all Terraform files
	terraform fmt -recursive .

.PHONY: test
test:  ## Run tests
	cd test/ && go test -v -count 1 -timeout $(GO_TEST_TIMEOUT)

.PHONY: bump-version/major
bump-version/major:  ## Increment the major version (X.y.z)
	bump2version major

.PHONY: bump-version/minor
bump-version/minor:  ## Increment the minor version (x.Y.z)
	bump2version minor

.PHONY:  bump-version/patch
bump-version/patch:  ## Increment the patch version (x.y.Z)
	bump2version patch

.PHONY: release
release:  ## Push the new project version
	git push --follow-tags origin $(DEFAULT_BRANCH)
