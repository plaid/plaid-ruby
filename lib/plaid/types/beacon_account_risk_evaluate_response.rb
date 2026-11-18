# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # BeaconAccountRiskEvaluateResponse defines the response schema for `/beacon/account_risk/v1/evaluate`
    class BeaconAccountRiskEvaluateResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false

      field :accounts, -> { Internal::Types::Array[Plaid::Types::BeaconAccountRiskEvaluateAccount] }, optional: false, nullable: false
    end
  end
end
