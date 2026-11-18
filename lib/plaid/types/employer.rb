# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Data about the employer.
    class Employer < Internal::Types::Model
      field :employer_id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :address, -> { Plaid::Types::AddressDataNullable }, optional: false, nullable: true

      field :confidence_score, -> { Float }, optional: false, nullable: false
    end
  end
end
