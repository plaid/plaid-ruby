# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # URLs associated with the entity screening hit
    class EntityScreeningHitURLs < Internal::Types::Model
      field :url, -> { String }, optional: false, nullable: false
    end
  end
end
