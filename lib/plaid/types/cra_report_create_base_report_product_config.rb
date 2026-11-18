# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Requests the given version of the Base Report product, optionally configuring how it is generated.
    class CraReportCreateBaseReportProductConfig < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false

      field :options, -> { Plaid::Types::CraReportCreateBaseReportOptions }, optional: true, nullable: true
    end
  end
end
