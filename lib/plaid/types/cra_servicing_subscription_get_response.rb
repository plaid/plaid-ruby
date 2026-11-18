# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraServicingSubscriptionGetResponse defines the response schema for `/cra/servicing/subscription/get`.
    class CraServicingSubscriptionGetResponse < Internal::Types::Model
      field :subscription, -> { Plaid::Types::CraServicingSubscription }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
