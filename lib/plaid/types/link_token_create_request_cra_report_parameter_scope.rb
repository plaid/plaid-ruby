# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module LinkTokenCreateRequestCraReportParameterScope
      extend Plaid::Internal::Types::Enum

      PLAID_NETWORK = "PLAID_NETWORK"
      CLIENT_USER = "CLIENT_USER"
    end
  end
end
