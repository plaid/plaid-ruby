# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An optional object to filter `/beacon/account_risk/v1/evaluate` results to a subset of the accounts on the linked
    # Item.
    class BeaconAccountRiskEvaluateRequestOptions < Internal::Types::Model
      field :account_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
