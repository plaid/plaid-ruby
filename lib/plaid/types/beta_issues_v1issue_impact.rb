# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The client-specific impact of an error issue.
    class BetaIssuesV1IssueImpact < Internal::Types::Model
      field :affected_new_item_count, -> { Integer }, optional: false, nullable: false

      field :affected_existing_item_count, -> { Integer }, optional: false, nullable: false
    end
  end
end
