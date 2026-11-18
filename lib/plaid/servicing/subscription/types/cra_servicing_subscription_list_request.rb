# frozen_string_literal: true

module Plaid
  module Servicing
    module Subscription
      module Types
        class CraServicingSubscriptionListRequest < Internal::Types::Model
          field :user_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
