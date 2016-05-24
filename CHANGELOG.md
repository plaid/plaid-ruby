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
