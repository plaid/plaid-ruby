# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # BetaIssuesV1GetResponse defines the response schema for `/beta/issues/v1/get`.
    class BetaIssuesV1GetResponse < Internal::Types::Model
      field :issue_id, -> { String }, optional: false, nullable: false

      field :issue_type, -> { Plaid::Types::BetaIssuesV1IssueType }, optional: false, nullable: false

      field :severity, -> { Plaid::Types::BetaIssuesV1IssueSeverity }, optional: false, nullable: false

      field :institution_id, -> { String }, optional: false, nullable: false

      field :institution_name, -> { String }, optional: false, nullable: false

      field :behaviors, -> { Internal::Types::Array[Plaid::Types::BetaIssuesV1IssueBehavior] }, optional: false, nullable: false

      field :issue_error_type, -> { String }, optional: false, nullable: true

      field :issue_error_code, -> { String }, optional: false, nullable: true

      field :description, -> { String }, optional: false, nullable: false

      field :attribution, -> { Plaid::Types::BetaIssuesV1IssueAttribution }, optional: false, nullable: false

      field :status, -> { Plaid::Types::BetaIssuesV1IssueStatus }, optional: false, nullable: false

      field :user_guidance, -> { String }, optional: false, nullable: true

      field :estimated_resolution_time, -> { String }, optional: false, nullable: true

      field :start_time, -> { String }, optional: false, nullable: true

      field :end_time, -> { String }, optional: false, nullable: true

      field :impact, -> { Plaid::Types::BetaIssuesV1IssueImpact }, optional: false, nullable: true

      field :affected_products, -> { Internal::Types::Array[Plaid::Types::Products] }, optional: false, nullable: false

      field :resolution_log, -> { Internal::Types::Array[Plaid::Types::BetaIssuesV1IssueResolutionEvent] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
