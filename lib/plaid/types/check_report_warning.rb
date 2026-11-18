# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # It is possible for a Check Report product to be returned with missing information. In such cases, the product will
    # contain warning data in the response, indicating why some of the requested information could not be retrieved.
    class CheckReportWarning < Internal::Types::Model
      field :warning_type, -> { String }, optional: false, nullable: false

      field :warning_code, -> { Plaid::Types::CheckReportWarningCode }, optional: false, nullable: false

      field :cause, -> { Plaid::Types::Cause }, optional: false, nullable: true
    end
  end
end
