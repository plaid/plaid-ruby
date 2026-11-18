# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Object containing employer data.
    class CreditBankEmployer < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
    end
  end
end
