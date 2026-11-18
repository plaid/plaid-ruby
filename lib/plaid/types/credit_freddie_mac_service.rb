# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A collection of details related to a fulfillment service or product in terms of request, process and result.
    class CreditFreddieMacService < Internal::Types::Model
      field :verification_of_asset, -> { Internal::Types::Array[Plaid::Types::CreditFreddieMacVerificationOfAsset] }, optional: false, nullable: false, api_name: "VERIFICATION_OF_ASSET"

      field :statuses, -> { Plaid::Types::Statuses }, optional: false, nullable: false, api_name: "STATUSES"
    end
  end
end
