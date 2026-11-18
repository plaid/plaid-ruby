# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information about the last webhook fired for the Item.
    class ItemStatusLastWebhook < Internal::Types::Model
      field :sent_at, -> { String }, optional: true, nullable: true

      field :code_sent, -> { String }, optional: true, nullable: false
    end
  end
end
