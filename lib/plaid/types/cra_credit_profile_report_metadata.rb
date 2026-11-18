# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Metadata about the CRA Credit Profile Report.
    class CraCreditProfileReportMetadata < Internal::Types::Model
      field :item_count, -> { Integer }, optional: false, nullable: false

      field :institution_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :account_count, -> { Integer }, optional: false, nullable: false

      field :primary_account_count, -> { Integer }, optional: false, nullable: false

      field :depository_account_type_count, -> { Integer }, optional: false, nullable: false

      field :credit_account_type_count, -> { Integer }, optional: false, nullable: false

      field :investment_account_type_count, -> { Integer }, optional: false, nullable: false

      field :other_account_type_count, -> { Integer }, optional: false, nullable: false

      field :multiple_owner_account_count, -> { Integer }, optional: false, nullable: false

      field :generated_at, -> { String }, optional: false, nullable: false

      field :oldest_transaction_date, -> { String }, optional: false, nullable: false

      field :most_recent_transaction_date, -> { String }, optional: false, nullable: false
    end
  end
end
