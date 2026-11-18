# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Captures and analysis from a user's selfie.
    class SelfieCheckSelfie < Internal::Types::Model
      field :status, -> { Plaid::Types::SelfieStatus }, optional: false, nullable: false

      field :attempt, -> { Integer }, optional: false, nullable: false

      field :capture, -> { Plaid::Types::SelfieCapture }, optional: false, nullable: false

      field :analysis, -> { Plaid::Types::SelfieAnalysis }, optional: false, nullable: false
    end
  end
end
