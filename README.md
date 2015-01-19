# Plaid

Ruby bindings for the Plaid API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'plaid'
```

And install

    $ bundle

Or install it system wide as:

    $ gem install plaid

## Usage

Please read the great documentation at http://plaid.com/docs/ for more information.

Configure the gem with your customer id, secret key, and the environment path you would like to use.

```ruby
Plaid.config do |p|
    p.customer_id = ['test_id']
    p.secret = ['test_secret']
    p.environment_location = ['https://tartan.plaid.com/']
   end
```

Authenticate a user to your desired level of api access (auth / connect).

```ruby
    user = Plaid.auth('auth','plaid_test','plaid_good','wells')
```

# Authentication Flow

The authentication flow is used to give you access to the Plaid API for one instance of a user.

```ruby
  user = Plaid.auth([api-access-level],[username],[password],[type])
```

Use 'auth' for Plaid Auth (see: https://plaid.com/docs/#auth for more information).
Use 'connect' for Plaid Connect (see: https://plaid.com/docs/#connect).

When a user is successfully authenticated you will receive a user object with fields based on the API Access Level requested.

# Multi-Factor Authentication

# User Methods & Vars

## Vars

User.accounts :; Array

-- An array of account objects belonging to this user

User.transactions :: Array

-- An array of transaction objects belonging to this user

User.permissions :: Array

-- An array of the api permissions currently granted to this user

User.access_token :: String

-- The access token used for back-end communication & identification with the Plaid API.

## Methods

User.upgrade

-- Upgrades the user to all access for the Plaid API.

User.get_connect

-- Returns the transactions and accounts for a user using the connect API into the User Object. See https://plaid.com/docs/#retrieve-transactions.

User.get_auth

-- Returns the accounts and account numbers from the auth API into the User Object. See https://plaid.com/docs/#retrieve-data.

## Account Vars

Account.name :: String

-- The name of the account

Account.available_balance :: Float

-- The available balance for this account

Account.current_balance :: Float

-- The current balance for this account

Account.institution_type :: String

-- The type of account for this account

Account.meta :: Hash

-- Various extra data sent by the institution for this account in the form of

Account.numbers :: Hash

-- Data sent from the Plaid Auth API which defines routing numbers and wire numbers. See https://plaid.com/docs/#auth for more information.

** Note: Account.numbers will return a string ('Upgrade user to access routing information for this account') if the user has an incorrect permission level.

## Transaction Vars

Transaction.id :: String

-- The id for this transaction defined by Plaid.

Transaction.account :: String

-- The account ID this transactionb belongs to

Transaction.amount :: String

-- The amount this transaction was worth

Transaction.name :: String

-- The name attached to this transaction

Transaction.meta :: Hash

-- Meta data returned from the institution

Transaction.location :: String

-- The location of the transaction

Transaction.pending :: String

-- Defines if this transaction is pending clearance

Transaction.category :: Hash

-- The category information for this transaction determined by Plaid

# Category

The category flow returns either an array of category objects or one category object

```ruby
    category = Plaid.category([category-id])
```

Returns one category object

```ruby
    category = Plaid.category
```

Returns all categories defined by Plaid in an array of category objects

## Category vars

Category.type :: String

-- Returns the type of category

Category.hierarchy :: Hash

-- Returns the meta data for a category

Category.id :: String

-- Returns the id for a category defined by Plaid

# Institution

The institution flow returns either an array of category objects or one category object

```ruby
    category = Plaid.institution([institution_id])
```

Returns one institutions object

```ruby
    category = Plaid.institution
```

Returns all institutions defined by Plaid in an array of category objects

## Institution vars

Category.id :: String

-- Returns the id for this institution

Category.name :: String

-- Returns the name for this institution

Category.type

-- Returns the type of this institution as defined by Plaid

Category.has_mfa

-- Returns whether this institution requires multi factor authentication

Category.mfa

-- Returns details about the required MFA for this institution

## Contributing

We highly encourage helping out with the gem. Either adding more tests, building new helper classes, fixing bugs,
or anything to increase overall quality.

The rules for contributing are simple:

1. No outside runtime libraries are allowed unless approved by the maintainer.
2. Follow the workflow set up below. Bug fixes should be labeled as a hot-fix, features labeled as features
3. Semantic versioning is strictly adhered to.
4. If you build a new feature you must release an update to the readme with information about the feature before it is accepted and commited.
5. New rubygems versions will be based on test coverage and passing tests, or time span for smaller combined bug fixes.

Contribution rules:

1. Fork it ( https://github.com/plaid/plaid-ruby/fork )
2a) Create your feature branch (`git checkout -b feature/my-new-feature`)
2b) Create your new hot-fix branch (`git checkout -b hot-fix/my-new-hotfix`)
3. Commit your changes
4. Push to the branch (`git push origin feature/my-new-feature`)
5. Create a new Pull Request
6. Wait for review and merge or notes to get merge accepted
