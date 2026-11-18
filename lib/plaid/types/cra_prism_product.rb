# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Names the Prism product at a given version.
    class CraPrismProduct < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false
    end
  end
end
