# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Requests the given version of the LendScore product, optionally configuring how it is generated.
    class CraReportCreateLendScoreProductConfig < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false

      field :options, -> { Plaid::Types::CraReportCreateLendScoreOptions }, optional: true, nullable: true
    end
  end
end
