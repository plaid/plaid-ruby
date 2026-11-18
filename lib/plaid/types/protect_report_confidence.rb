# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module ProtectReportConfidence
      extend Plaid::Internal::Types::Enum

      CONFIRMED = "CONFIRMED"
      SUSPECTED = "SUSPECTED"
    end
  end
end
