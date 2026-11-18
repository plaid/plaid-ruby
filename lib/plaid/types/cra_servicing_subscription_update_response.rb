# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraServicingSubscriptionUpdateResponse defines the response schema for `/cra/servicing/subscription/update`.
    class CraServicingSubscriptionUpdateResponse < Internal::Types::Model
      field :subscription_id, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
