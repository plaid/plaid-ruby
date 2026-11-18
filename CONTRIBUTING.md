# Contributing

Instructions for contributing to [plaid-ruby][1]. A ruby client library for the [Plaid API][2]. This library is fully generated from the [Plaid OpenAPI spec][3].

This library cannot directly accept PRs from the public as it is generated from internal Plaid sources on the internal Plaid GitHub instance and any changes made directly to this repo will be overwritten. If you submit a PR and it is accepted, a member of Plaid engineering will copy and paste your change into the upstream, internal version of this repo rather than merging your PR. 

Plaid employees should make any changes on the internal Plaid GitHub and not on the public repo. 
## Setup

If you find an issue, please investigate whether it is a type problem with [OpenAPI][3] or a problem with the generated SDK. Then open an issue and Plaid will investigate further.

## Running Tests

The gem supports Ruby 3.3 and later. Install dependencies with `bundle install`, then:

- Run the offline tests with `bundle exec rake test`.
- Run the WireMock-backed tests as well with `RUN_WIRE_TESTS=true bundle exec rake test`. They start a WireMock container, so Docker must be running.
- Run the previous SDK's Sandbox tests (`Plaid::Legacy`) by copying your `client_id` and Sandbox `secret` from the [Plaid Dashboard](https://dashboard.plaid.com/) into `PLAID_RUBY_CLIENT_ID` and `PLAID_RUBY_SECRET`, then running `bundle exec ruby -Ilib -e 'ARGV.each { |file| require File.expand_path(file) }' test/legacy/*_integration.rb`.

[1]: https://github.com/plaid/plaid-ruby
[2]: https://plaid.com
[3]: https://github.com/plaid/plaid-openapi
