# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Base Report metadata returned by `/cra/report/get`.
    class CraReportGetBaseReportMetadata < Internal::Types::Model
      field :generated_time, -> { String }, optional: false, nullable: true

      field :item_count, -> { Integer }, optional: false, nullable: false

      field :account_count, -> { Integer }, optional: false, nullable: false

      field :institution_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :days_requested, -> { Integer }, optional: false, nullable: false

      field :primary_account_count, -> { Integer }, optional: false, nullable: false

      field :depository_account_type_count, -> { Integer }, optional: false, nullable: false

      field :credit_account_type_count, -> { Integer }, optional: false, nullable: false

      field :investment_account_type_count, -> { Integer }, optional: false, nullable: false

      field :other_account_type_count, -> { Integer }, optional: false, nullable: false

      field :multiple_owner_account_count, -> { Integer }, optional: false, nullable: false

      field :oldest_transaction_date, -> { String }, optional: false, nullable: true

      field :most_recent_transaction_date, -> { String }, optional: false, nullable: true
    end
  end
end
