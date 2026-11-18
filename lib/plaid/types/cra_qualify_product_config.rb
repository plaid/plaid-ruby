# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The Qualify product at a given version. Qualify accepts no additional configuration today.
    class CraQualifyProductConfig < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false
    end
  end
end
