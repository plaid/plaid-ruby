# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Analyzed AAMVA data for the associated hit.
    #
    # Note: This field is only available for U.S. driver's licenses issued by participating states.
    class AamvaAnalysis < Internal::Types::Model
      field :is_verified, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :id_number, -> { Plaid::Types::AamvaMatchResult }, optional: false, nullable: false

      field :id_issue_date, -> { Plaid::Types::AamvaMatchResult }, optional: false, nullable: false

      field :id_expiration_date, -> { Plaid::Types::AamvaMatchResult }, optional: false, nullable: false

      field :street, -> { Plaid::Types::AamvaDetailedMatchResult }, optional: false, nullable: false

      field :city, -> { Plaid::Types::AamvaMatchResult }, optional: false, nullable: false

      field :postal_code, -> { Plaid::Types::AamvaDetailedMatchResult }, optional: false, nullable: false

      field :date_of_birth, -> { Plaid::Types::AamvaMatchResult }, optional: false, nullable: false

      field :gender, -> { Plaid::Types::AamvaMatchResult }, optional: false, nullable: false

      field :height, -> { Plaid::Types::AamvaMatchResult }, optional: false, nullable: false

      field :eye_color, -> { Plaid::Types::AamvaMatchResult }, optional: false, nullable: false

      field :first_name, -> { Plaid::Types::AamvaDetailedMatchResult }, optional: false, nullable: false

      field :middle_name, -> { Plaid::Types::AamvaDetailedMatchResult }, optional: false, nullable: false

      field :last_name, -> { Plaid::Types::AamvaDetailedMatchResult }, optional: false, nullable: false
    end
  end
end
