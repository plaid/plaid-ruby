# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Configures how the Home Lending VOA product is generated.
    class CraReportCreateHomeLendingVoaOptions < Internal::Types::Model
      field :report_format, -> { Plaid::Types::CraHomeLendingVoaReportFormat }, optional: true, nullable: false
    end
  end
end
