# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Custom client fields
    class ClientCustomization < Internal::Types::Model
      field :custom_entity_id, -> { String }, optional: true, nullable: false
    end
  end
end
