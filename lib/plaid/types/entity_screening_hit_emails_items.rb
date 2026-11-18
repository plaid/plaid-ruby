# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Analyzed emails for the associated hit
    class EntityScreeningHitEmailsItems < Internal::Types::Model
      field :analysis, -> { Plaid::Types::MatchSummary }, optional: true, nullable: false

      field :data, -> { Plaid::Types::EntityScreeningHitEmails }, optional: true, nullable: false
    end
  end
end
