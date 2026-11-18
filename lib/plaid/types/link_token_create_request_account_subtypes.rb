# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # By default, Link will only display account types that are compatible with all products supplied in the `products`
    # parameter of `/link/token/create`. You can further limit the accounts shown in Link by using `account_filters` to
    # specify the account subtypes to be shown in Link. Only the specified subtypes will be shown. This filtering
    # applies to both the Account Select view (if enabled) and the Institution Select view. Institutions that do not
    # support the selected subtypes will be omitted from Link. To indicate that all subtypes should be shown, use the
    # value `"all"`. If the `account_filters` filter is used, any account type for which a filter is not specified will
    # be entirely omitted from Link.
    #
    # For a full list of valid types and subtypes, see the [Account
    # schema](https://plaid.com/docs/api/accounts#account-type-schema).
    #
    # For institutions using OAuth, the filter will not affect the list of institutions or accounts shown by the bank in
    # the OAuth window.
    class LinkTokenCreateRequestAccountSubtypes < Internal::Types::Model
      field :depository, -> { Plaid::Types::LinkTokenCreateDepositoryFilter }, optional: true, nullable: false

      field :credit, -> { Plaid::Types::LinkTokenCreateCreditFilter }, optional: true, nullable: false

      field :loan, -> { Plaid::Types::LinkTokenCreateLoanFilter }, optional: true, nullable: false

      field :investment, -> { Plaid::Types::LinkTokenCreateInvestmentFilter }, optional: true, nullable: false
    end
  end
end
