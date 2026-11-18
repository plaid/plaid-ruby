# frozen_string_literal: true

module Plaid
  module Servicing
    module Subscription
      module Types
        class CraServicingSubscriptionCreateRequest < Internal::Types::Model
          field :user_id, -> { String }, optional: false, nullable: false

          field :scope, -> { Plaid::Types::CraReportScope }, optional: false, nullable: false

          field :cadence, -> { Plaid::Types::CraSubscriptionCadence }, optional: true, nullable: true

          field :webhook, -> { String }, optional: true, nullable: false

          field :products, -> { Internal::Types::Array[Plaid::Types::CraSubscriptionProductConfig] }, optional: false, nullable: false
        end
      end
    end
  end
end
