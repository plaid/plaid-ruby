# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # InvestmentsAuthGetResponse defines the response schema for `/investments/auth/get`
    class InvestmentsAuthGetResponse < Internal::Types::Model
      field :accounts, -> { Internal::Types::Array[Plaid::Types::InvestmentAccount] }, optional: false, nullable: false

      field :holdings, -> { Internal::Types::Array[Plaid::Types::Holding] }, optional: false, nullable: false

      field :securities, -> { Internal::Types::Array[Plaid::Types::Security] }, optional: false, nullable: false

      field :owners, -> { Internal::Types::Array[Plaid::Types::InvestmentsAuthOwner] }, optional: false, nullable: false

      field :numbers, -> { Plaid::Types::InvestmentsAuthGetNumbers }, optional: false, nullable: false

      field :data_sources, -> { Plaid::Types::InvestmentsAuthDataSources }, optional: false, nullable: false

      field :account_details401k, -> { Internal::Types::Array[Plaid::Types::InvestmentsAuthAccountDetails401K] }, optional: true, nullable: false, api_name: "account_details_401k"

      field :item, -> { Plaid::Types::Item }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
