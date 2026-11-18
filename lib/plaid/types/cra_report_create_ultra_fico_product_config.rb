# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Requests the given version of the UltraFICO product and configures the scores to generate.
    class CraReportCreateUltraFicoProductConfig < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false

      field :options, -> { Plaid::Types::CraReportCreateUltraFicoOptions }, optional: false, nullable: false
    end
  end
end
