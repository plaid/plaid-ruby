# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Contains data for the CRA LendScore Report.
    class CraLendScoreReport < Internal::Types::Model
      field :report_id, -> { String }, optional: false, nullable: false

      field :generated_time, -> { String }, optional: false, nullable: false

      field :lend_score, -> { Plaid::Types::LendScore }, optional: true, nullable: true
    end
  end
end
