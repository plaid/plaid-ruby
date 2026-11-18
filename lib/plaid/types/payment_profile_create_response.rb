# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # PaymentProfileCreateResponse defines the response schema for `/payment_profile/create`
    class PaymentProfileCreateResponse < Internal::Types::Model
      field :payment_profile_token, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
