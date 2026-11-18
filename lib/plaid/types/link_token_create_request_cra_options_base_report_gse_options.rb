# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specifies options for initializing Link to create reports that can be shared with GSEs for mortgage verification.
    class LinkTokenCreateRequestCraOptionsBaseReportGseOptions < Internal::Types::Model
      field :report_types, -> { Internal::Types::Array[Plaid::Types::GseReportType] }, optional: false, nullable: false
    end
  end
end
