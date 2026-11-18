# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object containing employer data.
    class EmployerVerification < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: true
    end
  end
end
