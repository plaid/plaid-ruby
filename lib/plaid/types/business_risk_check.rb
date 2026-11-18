# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Results from the business risk assessment check
    class BusinessRiskCheck < Internal::Types::Model
      field :status, -> { Plaid::Types::BusinessVerificationStatusRiskCheck }, optional: false, nullable: false

      field :score, -> { Integer }, optional: false, nullable: true
    end
  end
end
