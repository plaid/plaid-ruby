# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Configures how the LendScore Complete product bundle is generated.
    class CraReportCreateLendScoreCompleteOptions < Internal::Types::Model
      field :variants, -> { Internal::Types::Array[Plaid::Types::CraLendScoreVariant] }, optional: true, nullable: false
    end
  end
end
