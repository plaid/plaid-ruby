# frozen_string_literal: true

module Plaid
  module Item
    module Types
      class ItemWebhookUpdateRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :webhook, -> { String }, optional: true, nullable: true
      end
    end
  end
end
