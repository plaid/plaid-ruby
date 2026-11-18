# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Documentation not found in the MISMO model viewer and not provided by Freddie Mac.
    class CreditFreddieMacAssets < Internal::Types::Model
      field :asset, -> { Internal::Types::Array[Plaid::Types::CreditFreddieMacAsset] }, optional: false, nullable: false, api_name: "ASSET"
    end
  end
end
