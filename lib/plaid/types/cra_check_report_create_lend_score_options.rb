# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines configuration options to generate the LendScore
    class CraCheckReportCreateLendScoreOptions < Internal::Types::Model
      field :lend_score_version, -> { Plaid::Types::PlaidLendScoreVersion }, optional: true, nullable: true
    end
  end
end
