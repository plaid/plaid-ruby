# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Optional arguments for `/income/verification/create`
    class IncomeVerificationCreateRequestOptions < Internal::Types::Model
      field :access_tokens, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
