# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information describing a transaction category
    class Category < Internal::Types::Model
      field :category_id, -> { String }, optional: false, nullable: false

      field :group, -> { String }, optional: false, nullable: false

      field :hierarchy, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
