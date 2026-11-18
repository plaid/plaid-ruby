# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Documentation not found in the MISMO model viewer and not provided by Freddie Mac.
    class CreditFreddieMacVerificationOfAssetResponse < Internal::Types::Model
      field :assets, -> { Plaid::Types::CreditFreddieMacAssets }, optional: false, nullable: false, api_name: "ASSETS"
    end
  end
end
