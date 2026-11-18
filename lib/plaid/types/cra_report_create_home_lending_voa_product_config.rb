# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Requests the given version of the Home Lending VOA product, optionally configuring how it is generated.
    class CraReportCreateHomeLendingVoaProductConfig < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false

      field :options, -> { Plaid::Types::CraReportCreateHomeLendingVoaOptions }, optional: true, nullable: true
    end
  end
end
