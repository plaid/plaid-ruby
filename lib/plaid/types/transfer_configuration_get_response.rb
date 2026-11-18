# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/configuration/get`
    class TransferConfigurationGetResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false

      field :max_single_transfer_amount, -> { String }, optional: false, nullable: false

      field :max_single_transfer_credit_amount, -> { String }, optional: false, nullable: false

      field :max_single_transfer_debit_amount, -> { String }, optional: false, nullable: false

      field :max_daily_credit_amount, -> { String }, optional: false, nullable: false

      field :max_daily_debit_amount, -> { String }, optional: false, nullable: false

      field :max_monthly_amount, -> { String }, optional: false, nullable: false

      field :max_monthly_credit_amount, -> { String }, optional: false, nullable: false

      field :max_monthly_debit_amount, -> { String }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: false
    end
  end
end
