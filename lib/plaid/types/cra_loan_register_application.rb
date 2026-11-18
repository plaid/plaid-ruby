# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Contains loan application data to register.
    class CraLoanRegisterApplication < Internal::Types::Model
      field :application_id, -> { String }, optional: true, nullable: false

      field :application_date, -> { String }, optional: true, nullable: false
    end
  end
end
