# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Documentation not found in the MISMO model viewer and not provided by Freddie Mac.
    class Asset < Internal::Types::Model
      field :asset_detail, -> { Plaid::Types::AssetDetail }, optional: false, nullable: false, api_name: "ASSET_DETAIL"

      field :asset_owners, -> { Plaid::Types::AssetOwners }, optional: false, nullable: false, api_name: "ASSET_OWNERS"

      field :asset_holder, -> { Plaid::Types::AssetHolder }, optional: false, nullable: false, api_name: "ASSET_HOLDER"

      field :asset_transactions, -> { Plaid::Types::AssetTransactions }, optional: false, nullable: false, api_name: "ASSET_TRANSACTIONS"

      field :validation_sources, -> { Plaid::Types::ValidationSources }, optional: false, nullable: false, api_name: "VALIDATION_SOURCES"
    end
  end
end
