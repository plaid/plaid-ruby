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
