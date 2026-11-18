# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Names the Income Complete product bundle at a given version.
    class CraIncomeCompleteBundleProduct < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false
    end
  end
end
