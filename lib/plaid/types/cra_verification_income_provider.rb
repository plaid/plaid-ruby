# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The object containing data about the income provider.
    class CraVerificationIncomeProvider < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :is_normalized, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
