# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing the student named on a Form I-20.
    class CreditI20Student < Internal::Types::Model
      field :given_name, -> { String }, optional: true, nullable: true

      field :surname_primary_name, -> { String }, optional: true, nullable: true

      field :passport_name, -> { String }, optional: true, nullable: true

      field :preferred_name, -> { String }, optional: true, nullable: true

      field :school_name, -> { String }, optional: true, nullable: true

      field :program_start_date, -> { String }, optional: true, nullable: true

      field :program_end_date, -> { String }, optional: true, nullable: true
    end
  end
end
