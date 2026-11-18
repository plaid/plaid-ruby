# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Metadata about the extracted account.
    class BaseReportAccountMetadata < Internal::Types::Model
      field :start_date, -> { String }, optional: false, nullable: true

      field :end_date, -> { String }, optional: false, nullable: true
    end
  end
end
