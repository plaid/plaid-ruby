# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The failure reason if the status for a sweep is `"failed"` or `"returned"`. Null value otherwise.
    class SweepFailure < Internal::Types::Model
      field :failure_code, -> { String }, optional: true, nullable: true

      field :description, -> { String }, optional: true, nullable: true
    end
  end
end
