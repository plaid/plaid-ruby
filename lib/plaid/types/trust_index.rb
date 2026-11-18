# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Represents a calculated Trust Index Score.
    class TrustIndex < Internal::Types::Model
      field :score, -> { Integer }, optional: false, nullable: false

      field :model, -> { String }, optional: false, nullable: false

      field :subscores, -> { Plaid::Types::TrustIndexSubscores }, optional: false, nullable: true
    end
  end
end
