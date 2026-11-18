# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # PaymentProfileRemoveResponse defines the response schema for `/payment_profile/remove`
    class PaymentProfileRemoveResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
