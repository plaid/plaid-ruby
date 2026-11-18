# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A single CRA servicing subscription.
    class CraServicingSubscription < Internal::Types::Model
      field :subscription_id, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: false, nullable: false

      field :scope, -> { Plaid::Types::CraReportScope }, optional: false, nullable: false

      field :cadence, -> { Plaid::Types::CraSubscriptionCadence }, optional: true, nullable: true

      field :webhook, -> { String }, optional: true, nullable: true

      field :products, -> { Internal::Types::Array[Plaid::Types::CraSubscriptionProductConfig] }, optional: false, nullable: false
    end
  end
end
