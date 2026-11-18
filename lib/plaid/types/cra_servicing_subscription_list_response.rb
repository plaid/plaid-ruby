# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraServicingSubscriptionListResponse defines the response schema for `/cra/servicing/subscription/list`.
    class CraServicingSubscriptionListResponse < Internal::Types::Model
      field :subscriptions, -> { Internal::Types::Array[Plaid::Types::CraServicingSubscription] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
