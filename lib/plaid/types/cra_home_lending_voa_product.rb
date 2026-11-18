# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Names the Home Lending VOA product at a given version, with options for selecting the report format.
    class CraHomeLendingVoaProduct < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false

      field :options, -> { Plaid::Types::CraReportGetHomeLendingVoaOptions }, optional: true, nullable: true
    end
  end
end
