# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A grouping of the Plaid produced transaction enrichment fields.
    class Enrichments < Internal::Types::Model
      field :check_number, -> { String }, optional: true, nullable: true

      field :counterparties, -> { Internal::Types::Array[Plaid::Types::Counterparty] }, optional: false, nullable: false

      field :entity_id, -> { String }, optional: true, nullable: true

      field :legacy_category_id, -> { String }, optional: true, nullable: true

      field :legacy_category, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :location, -> { Plaid::Types::Location }, optional: false, nullable: false

      field :logo_url, -> { String }, optional: false, nullable: true

      field :merchant_name, -> { String }, optional: false, nullable: true

      field :payment_channel, -> { Plaid::Types::PaymentChannel }, optional: false, nullable: false

      field :phone_number, -> { String }, optional: false, nullable: true

      field :personal_finance_category, -> { Plaid::Types::PersonalFinanceCategory }, optional: false, nullable: true

      field :personal_finance_category_icon_url, -> { String }, optional: false, nullable: false

      field :website, -> { String }, optional: false, nullable: true
    end
  end
end
