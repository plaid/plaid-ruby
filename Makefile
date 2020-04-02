DOCKER = docker run --env-file .env plaid-ruby
CREATE_STUB =
.PHONY: build
build:
	docker build -t plaid-ruby .

.PHONY: lint
lint: build
	$(DOCKER) bundle exec rubocop

.PHONY: test-stubbed
test-stubbed: lint
	$(DOCKER) bundle exec rake test_stubbed

.PHONY: test
test: lint
	$(DOCKER) bundle exec rake test

.PHONY: generate-stub
generate-stub:

	COMMAND='bash -c "RECORD_MODE=all STUB_API=1 ruby -w -I\"lib:test\" -rminitest/pride -rdotenv/load ${test}"'
	$(DOCKER) "$COMMAND"
