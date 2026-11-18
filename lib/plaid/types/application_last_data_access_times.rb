# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Describes the last time each datatype was accessed by an application.
    class ApplicationLastDataAccessTimes < Internal::Types::Model
      field :application_id, -> { String }, optional: false, nullable: false

      field :account_balance_info, -> { String }, optional: false, nullable: true

      field :account_routing_number, -> { String }, optional: false, nullable: true

      field :contact_info, -> { String }, optional: false, nullable: true

      field :transactions, -> { String }, optional: false, nullable: true

      field :credit_loan_info, -> { String }, optional: false, nullable: true

      field :investments, -> { String }, optional: false, nullable: true
    end
  end
end
