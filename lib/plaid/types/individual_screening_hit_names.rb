# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Name information for the associated individual watchlist hit
    class IndividualScreeningHitNames < Internal::Types::Model
      field :full, -> { String }, optional: false, nullable: false

      field :is_primary, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :weak_alias_determination, -> { Plaid::Types::WeakAliasDetermination }, optional: false, nullable: false
    end
  end
end
