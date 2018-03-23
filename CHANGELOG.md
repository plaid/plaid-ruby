# 5.0.0 xx-Mar-2018

* Introduce true response objects instead of deep nested hashes. Any of the
  three syntaxes can be used interchangeably for any API response:
  `response['foo']['bar']`, `response[:foo][:bar]`, or `response.foo.bar`.
* Add Dwolla and Apex products.

# 4.1.0 04-Jan-2018

* Make `/item/remove` the primary Item removal endpoint
* Add #options parameter to `/institutions/get`
* Handle network errors with `PlaidServerError`

# 4.0.0 09-Mar-2017

* Refactored the entire library to support [Plaid's new API](https://blog.plaid.com/improving-our-api/). Use the [transition guide](https://plaid.com/docs/link/transition-guide) to update your integration. Version 3.x.x of this gem is mirrored at [plaid-legacy](https://github.com/plaid/plaid-ruby-legacy).

# 3.0.0. 17-Jan-2017

* Add `/institutions/all` and `/institutions/all/search` endpoints, see [UPGRADING.md](UPGRADING.md#upgrading-from-2xx-to-300)

# 2.2.0. 03-Nov-2016

* Add `Transaction#reference_number` (@ericbirdsall).
* Fix webhook codes and add risk and income webhooks.

# 2.1.0. 19-Oct-2016

* Documentation fixes (@ishmael).
* Fix `Transaction#to_s` behavior (@michel-tricot).
* PATCH `/:product/step` flow.
* Use the same client in `User#upgrade` (@betesh).
* Webhook object (@zshannon).
* `processor_token` access in `User.exchange_token` (@gylaz).
* Raise `ServerError` in case server returned an empty response body.

# 2.0.0. 24-May-2016

* Use `~> 1.0` spec for multi_json dependency.
* Support `stripe_bank_account_token` in `User.exchange_token`.

# 2.0.0.alpha.2. 14-May-2016

* Use `:production` instead of `:api` to signify production environment
  in `Plaid::Client#env=`.
* `User#mfa_step` allows to specify options now (thanks @gcweeks).
* Implemented `User#update_webhook`.

# 2.0.0.alpha. 06-May-2016

* Rewrite everything.
