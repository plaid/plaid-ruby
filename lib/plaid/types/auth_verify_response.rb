# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # AuthVerifyResponse defines the response schema for `/auth/verify`
    class AuthVerifyResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: true, nullable: true

      field :verification_status, -> { String }, optional: false, nullable: false

      field :verification_insights, -> { Plaid::Types::AccountVerificationInsights }, optional: false, nullable: false
    end
  end
end
