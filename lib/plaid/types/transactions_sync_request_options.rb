# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An optional object to be used with the request. If specified, `options` must not be `null`.
    class TransactionsSyncRequestOptions < Internal::Types::Model
      field :include_original_description, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :include_personal_finance_category, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :include_logo_and_counterparty_beta, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :personal_finance_category_version, -> { Plaid::Types::PersonalFinanceCategoryVersion }, optional: true, nullable: false

      field :days_requested, -> { Integer }, optional: true, nullable: false

      field :account_id, -> { String }, optional: true, nullable: false
    end
  end
end
