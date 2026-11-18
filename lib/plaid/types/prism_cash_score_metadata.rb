# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object containing metadata about the provided transactions.
    class PrismCashScoreMetadata < Internal::Types::Model
      field :max_age, -> { Integer }, optional: false, nullable: true

      field :min_age, -> { Integer }, optional: false, nullable: true

      field :min_age_credit, -> { Integer }, optional: false, nullable: true

      field :min_age_debit, -> { Integer }, optional: false, nullable: true

      field :max_age_debit, -> { Integer }, optional: false, nullable: true

      field :max_age_credit, -> { Integer }, optional: false, nullable: true

      field :num_trxn_credit, -> { Integer }, optional: false, nullable: true

      field :num_trxn_debit, -> { Integer }, optional: false, nullable: true

      field :l1m_credit_value_cnt, -> { Integer }, optional: false, nullable: true

      field :l1m_debit_value_cnt, -> { Integer }, optional: false, nullable: true
    end
  end
end
