# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines configuration options for the Employment Refresh Report.
    class CraCheckReportCreateEmploymentRefreshOptions < Internal::Types::Model
      field :days_requested, -> { Integer }, optional: false, nullable: false
    end
  end
end
