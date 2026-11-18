# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module ProductStatusBreakdownRefreshInterval
      extend Plaid::Internal::Types::Enum

      NORMAL = "NORMAL"
      DELAYED = "DELAYED"
      STOPPED = "STOPPED"
    end
  end
end
