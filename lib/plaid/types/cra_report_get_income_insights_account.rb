# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An account used to generate `cra_income_insights`, with the consumer's dispute statements for it.
    class CraReportGetIncomeInsightsAccount < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :official_name, -> { String }, optional: false, nullable: true

      field :mask, -> { String }, optional: false, nullable: true

      field :type, -> { Plaid::Types::AccountType }, optional: false, nullable: false

      field :subtype, -> { Plaid::Types::AccountSubtype }, optional: false, nullable: true

      field :consumer_disputes, -> { Internal::Types::Array[Plaid::Types::ConsumerDispute] }, optional: false, nullable: false
    end
  end
end
