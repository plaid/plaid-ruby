# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraServicingSubscriptionDeleteResponse defines the response schema for `/cra/servicing/subscription/delete`.
    class CraServicingSubscriptionDeleteResponse < Internal::Types::Model
      field :subscription_id, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
