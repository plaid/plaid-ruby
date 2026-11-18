# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A Link-originated Identity Match attempt.
    class IdentityMatchListAttempt < Internal::Types::Model
      field :attempt_id, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: true

      field :created_at, -> { String }, optional: false, nullable: false

      field :link_session_id, -> { String }, optional: false, nullable: false

      field :link_customization_name, -> { String }, optional: false, nullable: false

      field :ruleset_revision, -> { Integer }, optional: false, nullable: false

      field :outcome, -> { Plaid::Types::IdentityMatchListOutcome }, optional: false, nullable: false

      field :outcome_account_id, -> { String }, optional: false, nullable: true

      field :scores, -> { Internal::Types::Array[Plaid::Types::IdentityMatchListAttemptScore] }, optional: false, nullable: false
    end
  end
end
