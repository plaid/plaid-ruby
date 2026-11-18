# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Names the Home Lending product at a given version.
    class CraHomeLendingProduct < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false
    end
  end
end
