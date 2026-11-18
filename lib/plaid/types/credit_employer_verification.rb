# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object containing employer data.
    class CreditEmployerVerification < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: true
    end
  end
end
