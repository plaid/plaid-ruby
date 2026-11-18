# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The object containing prediction interval data.
    class CraPredictionInterval < Internal::Types::Model
      field :lower_bound, -> { Float }, optional: true, nullable: true

      field :upper_bound, -> { Float }, optional: true, nullable: true

      field :probability, -> { Float }, optional: true, nullable: true
    end
  end
end
