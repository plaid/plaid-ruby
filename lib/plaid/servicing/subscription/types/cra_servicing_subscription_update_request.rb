# frozen_string_literal: true

module Plaid
  module Servicing
    module Subscription
      module Types
        class CraServicingSubscriptionUpdateRequest < Internal::Types::Model
          field :subscription_id, -> { String }, optional: false, nullable: false

          field :webhook, -> { String }, optional: true, nullable: false

          field :products, -> { Internal::Types::Array[Plaid::Types::CraSubscriptionProductConfig] }, optional: true, nullable: false

          field :reset_fields, -> { Internal::Types::Array[Plaid::Types::CraServicingSubscriptionUpdateRequestResettableField] }, optional: true, nullable: true
        end
      end
    end
  end
end
