# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Delivery details for the standardized address, as reported by the data provider. `null` when
    # `standardized_address` is `null`.
    class BusinessAddressDeliverabilityNullable < Internal::Types::Model
      field :is_deliverable, -> { Internal::Types::Boolean }, optional: false, nullable: true

      field :is_cmra, -> { Internal::Types::Boolean }, optional: false, nullable: true

      field :residential_indicator, -> { Plaid::Types::BusinessResidentialIndicator }, optional: false, nullable: true

      field :delivery_type, -> { Plaid::Types::BusinessDeliveryType }, optional: false, nullable: true
    end
  end
end
