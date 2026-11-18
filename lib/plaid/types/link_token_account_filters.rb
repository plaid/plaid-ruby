# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # By default, Link will provide limited account filtering: it will only display Institutions that are compatible
    # with all products supplied in the `products` parameter of `/link/token/create`, and, if `auth` is specified in the
    # `products` array, will also filter out accounts other than `checking`, `savings`, and `cash management` accounts
    # on the Account Select pane. You can further limit the accounts shown in Link by using `account_filters` to specify
    # the account subtypes to be shown in Link. Only the specified subtypes will be shown. This filtering applies to
    # both the Account Select view (if enabled) and the Institution Select view. Institutions that do not support the
    # selected subtypes will be omitted from Link. To indicate that all subtypes should be shown, use the value `"all"`.
    # If the `account_filters` filter is used, any account type for which a filter is not specified will be entirely
    # omitted from Link. For a full list of valid types and subtypes, see the [Account
    # schema](https://plaid.com/docs/api/accounts#account-type-schema).
    #
    # The filter may or may not impact the list of accounts shown by the institution in the OAuth account selection
    # flow, depending on the specific institution. If the user selects excluded account subtypes in the OAuth flow,
    # these accounts will not be added to the Item. If the user selects only excluded account subtypes, the link attempt
    # will fail and the user will be prompted to try again.
    class LinkTokenAccountFilters < Internal::Types::Model
      field :depository, -> { Plaid::Types::DepositoryFilter }, optional: true, nullable: false

      field :credit, -> { Plaid::Types::CreditFilter }, optional: true, nullable: false

      field :loan, -> { Plaid::Types::LoanFilter }, optional: true, nullable: false

      field :investment, -> { Plaid::Types::InvestmentFilter }, optional: true, nullable: false

      field :other, -> { Plaid::Types::OtherFilter }, optional: true, nullable: false
    end
  end
end
