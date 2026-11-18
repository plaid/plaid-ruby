# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module IncidentUpdateStatus
      extend Plaid::Internal::Types::Enum

      INVESTIGATING = "INVESTIGATING"
      IDENTIFIED = "IDENTIFIED"
      SCHEDULED = "SCHEDULED"
      RESOLVED = "RESOLVED"
      UNKNOWN = "UNKNOWN"
    end
  end
end
