# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The details of a Link error.
    class CreditSessionError < Internal::Types::Model
      field :error_type, -> { String }, optional: true, nullable: false

      field :error_code, -> { String }, optional: true, nullable: false

      field :error_message, -> { String }, optional: true, nullable: false

      field :display_message, -> { String }, optional: true, nullable: true
    end
  end
end
