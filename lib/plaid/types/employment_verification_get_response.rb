# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # EmploymentVerificationGetResponse defines the response schema for `/employment/verification/get`.
    class EmploymentVerificationGetResponse < Internal::Types::Model
      field :employments, -> { Internal::Types::Array[Plaid::Types::EmploymentVerification] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
