# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Represents Trust Index Subscore.
    class TrustIndexSubscore < Internal::Types::Model
      field :score, -> { Integer }, optional: false, nullable: false
    end
  end
end
