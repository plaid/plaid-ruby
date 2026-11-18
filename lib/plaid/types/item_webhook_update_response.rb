# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ItemWebhookUpdateResponse defines the response schema for `/item/webhook/update`
    class ItemWebhookUpdateResponse < Internal::Types::Model
      field :item, -> { Plaid::Types::Item }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
