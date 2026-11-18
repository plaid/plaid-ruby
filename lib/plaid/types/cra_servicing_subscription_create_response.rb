# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraServicingSubscriptionCreateResponse defines the response schema for `/cra/servicing/subscription/create`.
    class CraServicingSubscriptionCreateResponse < Internal::Types::Model
      field :subscription_id, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
