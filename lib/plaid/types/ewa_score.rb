# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # EwaScore represents an earned wage access score for a specific advance amount range.
    class EwaScore < Internal::Types::Model
      field :lowest_amount, -> { Float }, optional: true, nullable: false

      field :highest_amount, -> { Float }, optional: true, nullable: false

      field :score, -> { Integer }, optional: true, nullable: false
    end
  end
end
