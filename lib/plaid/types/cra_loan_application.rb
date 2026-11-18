# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Contains loan application data.
    class CraLoanApplication < Internal::Types::Model
      field :user_token, -> { String }, optional: false, nullable: false

      field :application_id, -> { String }, optional: false, nullable: false

      field :type, -> { Plaid::Types::CraLoanType }, optional: false, nullable: false

      field :decision, -> { Plaid::Types::CraLoanApplicationDecision }, optional: false, nullable: false

      field :application_date, -> { String }, optional: true, nullable: false

      field :decision_date, -> { String }, optional: true, nullable: false
    end
  end
end
