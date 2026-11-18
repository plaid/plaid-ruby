# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A program that configures the active lists, search parameters, and other behavior for initial and ongoing
    # screening of individuals.
    class WatchlistScreeningIndividualProgramGetResponse < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false

      field :is_rescanning_enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :lists_enabled, -> { Internal::Types::Array[Plaid::Types::IndividualWatchlistCode] }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :name_sensitivity, -> { Plaid::Types::ProgramNameSensitivity }, optional: false, nullable: false

      field :audit_trail, -> { Plaid::Types::WatchlistScreeningAuditTrail }, optional: false, nullable: false

      field :is_archived, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
