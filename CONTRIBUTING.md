# Contributing

Instructions for contributing to [plaid-ruby][1]. A ruby client library for the [Plaid API][2]. This library is fully generated from the [Plaid OpenAPI spec][3].

## Setup

If you find an issue, please investigate whether it is a type problem with [OpenAPI](3) or a problem with the [ruby faraday](https://github.com/OpenAPITools/openapi-generator/blob/master/docs/generators/ruby.md) generator. Then open an issue and Plaid will investigate further.

## Running Tests

1. To build the docker image for the client tests, run `docker build -t plaid-ruby .`.
2. Go to the [Plaid Dashboard](https://dashboard.plaid.com/) and copy and paste your `client_id` and sandbox `secret` into the following command.
3. Run `docker run --rm -e PLAID_RUBY_CLIENT_ID=$CLIENT_ID -e PLAID_RUBY_SECRET=$SECRET plaid-ruby`.

If you wish to run a single test, edit the `Rakefile` and rebuild the docker image using the command from step 1.

[1]: https://github.com/plaid/plaid-ruby
[2]: https://plaid.com
[3]: https://github.com/plaid/plaid-openapi
