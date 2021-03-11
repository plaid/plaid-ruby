CURRENT_DIR:=$(shell pwd)
OPENAPI_FILE:=2020-09-14.yml
# Theres a bug in 5.0.1 for ruby generation. https://github.com/OpenAPITools/openapi-generator/issues/8677
OPENAPI_GENERATOR_5:=docker run --rm -v $(CURRENT_DIR):/local openapitools/openapi-generator-cli:v5.0.0 generate
OPENAPI_VERSION:=1.8.0-beta
# Ruby embeds the version in the generator where as others dont os its not possible to cat for it.
RUBY_PACKAGE_VERSION=14.0.0.beta.3

.PHONY: pull-openapi
pull-openapi:
	curl https://raw.githubusercontent.com/plaid/plaid-openapi/$(OPENAPI_VERSION)/$(OPENAPI_FILE) --output $(CURRENT_DIR)/$(OPENAPI_FILE)

.PHONY: build-openapi
build-openapi:
	$(OPENAPI_GENERATOR_5) -g ruby  \
	-i local/$(OPENAPI_FILE) \
	-o local/ \
	--global-property=apiTests=false,modelTests=false  \
	--library=faraday \
	-p gemName=plaid,gemRequiredRubyVersion=">= 2.4.0",gemVersion=$(RUBY_PACKAGE_VERSION) \
	-t local/templates/ruby