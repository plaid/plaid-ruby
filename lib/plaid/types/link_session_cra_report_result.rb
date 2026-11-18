# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Plaid Check report details for the Link session.
    class LinkSessionCraReportResult < Internal::Types::Model
      field :report_id, -> { String }, optional: false, nullable: true
    end
  end
end
