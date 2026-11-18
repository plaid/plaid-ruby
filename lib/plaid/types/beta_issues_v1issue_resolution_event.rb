# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A recorded reduction in the impact of an issue.
    class BetaIssuesV1IssueResolutionEvent < Internal::Types::Model
      field :resolution_time, -> { String }, optional: false, nullable: false

      field :type, -> { Plaid::Types::BetaIssuesV1IssueResolutionType }, optional: false, nullable: false
    end
  end
end
