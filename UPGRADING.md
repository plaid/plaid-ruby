## Upgrading from 3.x.x to 4.0.0

Version 4.0.0 supports [Plaid's new API](https://blog.plaid.com/improving-our-api/).  Use the [transition guide](https://plaid.com/docs/link/transition-guide) to update your integration.

## Upgrading from 2.x.x to 3.0.0

Version 3.0.0 makes `Plaid::Institution` use new `institutions/all` endpoint
of Plaid API which unites "native" and "long tail" institutions.
`Plaid::LongTailInstitution` class is removed, its functionality is
concentrated in `Plaid::Institution`.

Use `Plaid::Institution.all` instead of `Plaid::LongTailInstitution.all` (the
semantics is the same, with added products param).

Use `Plaid::Institution.search` instead of `Plaid::LongTailInstitution.search`.

Use `Plaid::Institution.search_by_id` instead of `Plaid::LongTailInstitution.get`.


## Upgrading from 1.x to 2.0.0

Make sure you use Ruby 2.0 or higher.

Update the `Plaid.config` block:

```ruby
Plaid.config do |p|
  p.client_id = '<<< Plaid provided client ID >>>'  # WAS: customer_id
  p.secret = '<<< Plaid provided secret key >>>'    # No change
  p.env = :tartan  # or :api for production         # WAS: environment_location
end
```

Use `Plaid::User.create` instead of `Plaid.add_user` (**NOTE**: parameter order has changed!)

Use `Plaid::User.load` instead of `Plaid.set_user` (**NOTE**: parameter order has changed!)

Use `Plaid::User.exchange_token` instead of `Plaid.exchange_token` (**NOTE**: parameter list has changed!)

Use `Plaid::User.create` or (`.load`) and `Plaid::User#transactions` instead of `Plaid.transactions`.

Use `Plaid::Institution.all` and `Plaid::Institution.get` instead of `Plaid.institution`.

Use `Plaid::Category.all` and `Plaid::Category.get` instead of `Plaid.category`.

`Plaid::Account#institution_type` was renamed to `Plaid::Account#institution`.

`Plaid::Transaction#account` was renamed to `Plaid::Transaction#account_id`.

`Plaid::Transaction#date` is a Date, not a String object now.

`Plaid::Transaction#cat` was removed. Use `Plaid::Transaction#category_hierarchy` and `Plaid::Transaction#category_id` directly.

`Plaid::Transaction#category` was renamed to `Plaid::Transaction#category_hierarchy`.

`Plaid::Transaction#pending_transaction` was renamed to `Plaid::Transaction#pending_transaction_id`.

Use `Plaid::User#mfa_step` instead of `Plaid::User#select_mfa_method` and `Plaid::User#mfa_authentication`.

`Plaid::User#permit?` was removed. You don't need this.

`Plaid::User.delete_user` was renamed to `Plaid::User.delete`.

**NOTE** that Symbols are now consistently used instead of Strings as product names, keys in hashes, etc. Look at the docs, they have all the examples.
