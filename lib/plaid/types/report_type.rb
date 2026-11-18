# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module ReportType
      extend Plaid::Internal::Types::Enum

      ASSET = "asset"
    end
  end
end
