# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Requests the given version of the Prism product and selects which Prism products to evaluate.
    class CraReportCreatePrismProductConfig < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false

      field :options, -> { Plaid::Types::CraReportCreatePrismOptions }, optional: false, nullable: false
    end
  end
end
