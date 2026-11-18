# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module DashboardUserStatus
      extend Plaid::Internal::Types::Enum

      INVITED = "invited"
      ACTIVE = "active"
      DEACTIVATED = "deactivated"
    end
  end
end
