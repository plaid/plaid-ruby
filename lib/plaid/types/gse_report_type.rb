# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module GseReportType
      extend Plaid::Internal::Types::Enum

      VOA = "VOA"
      EMPLOYMENT_REFRESH = "EMPLOYMENT_REFRESH"
    end
  end
end
