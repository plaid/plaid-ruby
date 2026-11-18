# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Documentation not found in the MISMO model viewer and not provided by Freddie Mac.
    class AssetTransactionDescription < Internal::Types::Model
      field :asset_transaction_description, -> { String }, optional: false, nullable: false, api_name: "AssetTransactionDescription"
    end
  end
end
