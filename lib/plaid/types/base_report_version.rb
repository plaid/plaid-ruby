# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BaseReportVersion
      extend Plaid::Internal::Types::Enum

      V1 = "V1"
      V2 = "V2"
    end
  end
end
