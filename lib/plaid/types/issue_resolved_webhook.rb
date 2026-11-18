# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Webhook notifications are sent only when a subscribed issue is marked as resolved. The payload contains details
    # about the issue at the time of its resolution, focusing on the most essential information.
    class IssueResolvedWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :issue_id, -> { String }, optional: false, nullable: false

      field :issue_description, -> { String }, optional: false, nullable: false

      field :issue_resolved_at, -> { String }, optional: false, nullable: false

      field :institution_id, -> { String }, optional: false, nullable: false

      field :institution_name, -> { String }, optional: false, nullable: false
    end
  end
end
