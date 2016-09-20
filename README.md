# Plaid [![Build Status](https://travis-ci.org/plaid/plaid-ruby.svg)](https://travis-ci.org/plaid/plaid-ruby) [![Gem Version](https://badge.fury.io/rb/plaid.svg)](http://badge.fury.io/rb/plaid)

Ruby bindings for the Plaid API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'plaid'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install plaid

The gem supports Ruby 2.x only.

## Usage

This gem wraps the Plaid API, which is fully described in the [documentation](http://plaid.com/docs).

The RubyDoc for the gem is available [here](http://plaid.github.io/plaid-ruby).

### Configuring access to Plaid

Configure the gem with your client id, secret, and the environment you would like to use.

```ruby
Plaid.config do |p|
  p.client_id = '<<< Plaid provided client ID >>>'
  p.secret = '<<< Plaid provided secret key >>>'
  p.env = :tartan  # or :production
end
```

### Creating a new User

```ruby
user = Plaid::User.create(:connect, 'wells', 'plaid_test', 'plaid_good')
```

This call will do a `POST /connect`. The response will contain account information and transactions
for last 30 days, which you can find in `user.accounts` and `user.initial_transactions`, accordingly.

If the authentication requires a pin, you can pass it as a named parameter:

```ruby
user = Plaid::User.create(:income, 'usaa', 'plaid_test', 'plaid_good', pin: '1234')
```

To add options such as `login_only` or `webhook`, use `options` argument:

```ruby
user = Plaid::User.create(:connect, 'wells', 'plaid_test', 'plaid_good',
                          options: { login_only: true, webhook: 'https://example.org/callbacks/plaid')
```

The first argument for `Plaid::User.create` is always a product you want to add the user to (like,
`:connect`, `:auth`, `:info`, `:income`, or `:risk`). The user object is bound to the product, and subsequent
calls like `user.update` or `user.delete` are done for this product (i.e., `PATCH /info` and `DELETE /info`
for `:info`).

### Instantiating a User with an existing access token

If you've already added the user and saved the access token, you should use `User.load`:

```ruby
user = Plaid::User.load(:risk, 'access_token')
```

This won't make any API requests by itself, just set the product and the token in the `User` instance.

### Exchanging a Link public token for a Plaid access token

If you have a Link public token, use `User.exchange_token`:

```ruby
user = Plaid::User.exchange_token('public_token')   # bound to :connect product
```

With more options:

```ruby
user2 = Plaid::User.exchange_token('public_token', 'account_id', product: :auth)
```

If you want to [move money via Stripe's ACH
API](https://plaid.com/docs/link/stripe/#step-4-write-server-side-handler), you
ought to specify the `account_id` param. In this case the returned user
instance will have the `stripe_bank_account_token` attribute set.

### Upgrading and changing the current product

Plaid supports upgrading a user, i.e. adding it to another product:

```ruby
# Create a user in Connect
user = Plaid::User.create(:connect, 'wells', 'plaid_test', 'plaid_good')

# Upgrade this user, attaching it to Auth as well (makes a request to /upgrade).
auth_user = user.upgrade(:auth)
```

The `auth_user` will be a different instance of `User`, attached to Auth, but the access token will be the same.

Sometimes you know that the user has already been added to another product. To get a `User` instance with
same access token, but different current product, use `User.for_product`:

```ruby
# Get a user attached to Connect
user = Plaid::User.load(:connect, 'access_token')

# Makes no requests
info_user = user.for_product(:info)
```

Basically it's the same as:

```ruby
info_user = Plaid::User.load(:info, 'access_token')
```

### MFA (Multi-Factor Authorization)

If MFA is requested by the financial institution, the `User.create` call would behave
a bit differently:

```ruby
user = Plaid::User.create(:auth, 'wells', 'plaid_test', 'plaid_good')

user.accounts   #=> nil
user.mfa?       #=> true
user.mfa_type   #=> :questions
user.mfa        #=> [{question: "What's the nickname of the person who created Ruby?"}]
```

In this case you'll have to submit the answer to the question:

```ruby
user.mfa_step('matz')        # This is the correct answer!

user.mfa?       #=> false
user.mfa_type   #=> nil
user.mfa        #=> nil
user.accounts   #=> [<Plaid::Account ...>, ...]
```

The code-based MFA workflow is similar. Basically you need to call `user.mfa_step(...)`
until `user.mfa?` becomes false.

### Obtaining user-related data

If you have a live `User` instance, you can use following methods
(independent of instance's current product):

* `user.transactions(...)`. Makes a `/connect/get` request.
* `user.auth(sync: false)`. Makes an `/auth/get` request.
* `user.info(sync: false)`. Makes an `/info/get` request.
* `user.income(sync: false)`. Makes an `/income/get` request.
* `user.risk(sync: false)`. Makes an `/risk/get` request.
* `user.balance`. Makes an `/balance` request.

All of these methods return appropriate data, but they also update the cached `user.accounts`. That is,
if you user has access to Auth and Risk  products, the following code:

```ruby
user = User.load(:auth, 'access_token')
user.auth
user.risk
```
will result in `user.accounts` having both routing number and risk information for all the accounts. The
subsequent `user.balance` call will just update the current balance, not touching the routing and risk information.

The `sync` flag, if set to true, will result in updating the information from the server even if it has already been
loaded. Otherwise cached information will be returned:

```ruby
user = User.load(:auth, 'access_token')   # Just set the token
user.auth                                 # POST /auth/get
user.auth                                 # No POST, return cached info
user.auth(sync: true)                     # POST /auth/get again
```

Same goes for other methods, except `User#transactions` and `User#balance` which always make requests to the API.

### Categories

You can request category information:

```ruby
cats = Plaid::Category.all             # Array of all known categories
cat  = Plaid::Category.get('17001013') # A single category by its ID
```

### Institutions

Financial institution information is available via `Plaid::Institution` and `Plaid::LongTailInstitution`:

```ruby
insts = Plaid::Institution.all                               # Array of all major financial institutions
inst  = Plaid::Institution.get('5301a93ac140de84910000e0')   # A single institution by its ID

lti  = Plaid::LongTailInstitution.get('bofa')                # A single one
ltis = Plaid::LongTailInstitution.all(count: 20, offset: 20) # A page
res  = Plaid::LongTailInstitution.search(query: 'c')         # Lookup by name
```

### Webhooks

You can register to receive [Webhooks](https://plaid.com/docs/api/#webhook) from Plaid when your users have new events. If you do, you'll receive `POST` requests with JSON.

E.g. Initial Transaction Webhook:
```json
{
 "message": "Initial transaction pull finished",
 "access_token": "xxxxx",
 "total_transactions": 123,
 "code": 0
}
```

You should parse that JSON into a Ruby Hash with String keys (eg. `webhook_hash = JSON.parse(json_string)`). Then, you can convert that Hash into a Ruby object using `Plaid::Webhook`:

```ruby
webhook = Plaid::Webhook.new(webhook_hash)

# Was that the Initial Transaction Webhook?
webhook.initial_transaction?
access_token = webhook.access_token
total_transactions = webhook.total_transactions

# Or did Historical Transactions become available?
webhook.historical_transaction?
access_token = webhook.access_token
total_transactions = webhook.total_transactions

# Or did Normal Transactions become available?
webhook.normal_transaction?
access_token = webhook.access_token
total_transactions = webhook.total_transactions

# Or maybe a transaction was removed?
webhook.removed_transaction?
access_token = webhook.access_token
removed_transactions_ids = webhook.removed_transactions_ids

# Or was the User's Webhook Updated?
webhook.user_webhook_updated?
access_token = webhook.access_token

# Otherwise, was it an error?
webhook.error_response?
# Which error?
error = webhook.error
```

### Custom clients

It's possible to use several Plaid environments and/or credentials in one app by
explicit instantiation of `Plaid::Client`:

```ruby
# Configuring the global client (Plaid.client) which is used by default
Plaid.config do |p|
  p.client_id = 'client_id_1'
  p.secret = 'secret_1'
  p.env = :tartan
end

# Creating a custom client
api = Plaid::Client.new(client_id: 'client_id_2', secret: 'secret_2', env: :production)

# Tartan user (using default client)
user1 = Plaid::User.create(:connect, 'wells', 'plaid_test', 'plaid_good')

# Api user (using api client)
user2 = Plaid::User.create(:connect, 'wells', 'plaid_test', 'plaid_good', client: api)

# Lookup a long tail institution in production
res = Plaid::LongTailInstitution.search(query: 'c', client: api)
```

The `client` option can be passed to the following methods:

* `User.create`
* `User.load`
* `User.exchange_token`
* `Category.all`
* `Category.get`
* `Institution.all`
* `Institution.get`
* `LongTailInstitution.all`
* `LongTailInstitution.search`
* `LongTailInstitution.get`

### Errors

Any methods making API calls will result in an exception raised unless the response code is "200: Success" or
"201: MFA Required".

`Plaid::BadRequestError` is raised when status code is "400: Bad Request".

`Plaid::UnauthorizedError` is raised when status code is "401: Unauthorized".

`Plaid::RequestFailedError` is raised when status code is "402: Request Failed".

`Plaid::NotFoundError` is raised when status code is "404: Cannot be Found".

`Plaid::ServerError` is raised when status code is "50X: Server Error".

Read more about response codes and their meaning in the
[Plaid documentation](https://plaid.com/docs/api/#response-codes).

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/plaid/plaid-ruby. See also [contributing guidelines](CONTRIBUTING.md).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
