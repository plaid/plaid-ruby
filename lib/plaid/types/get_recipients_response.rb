# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # GetRecipientsResponse defines the response schema for `/fdx/recipients`
    class GetRecipientsResponse < Internal::Types::Model
      field :recipients, -> { Internal::Types::Array[Plaid::Types::ExtendedRecipientMetadata] }, optional: false, nullable: false
    end
  end
end
