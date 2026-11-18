# frozen_string_literal: true

module Plaid
  module Servicing
    module Subscription
      module Types
        class CraServicingSubscriptionDeleteRequest < Internal::Types::Model
          field :subscription_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
