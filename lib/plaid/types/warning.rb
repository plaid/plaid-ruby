# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # It is possible for an Asset Report to be returned with missing account owner information. In such cases, the Asset
    # Report will contain warning data in the response, indicating why obtaining the owner information failed.
    class Warning < Internal::Types::Model
      field :warning_type, -> { String }, optional: false, nullable: false

      field :warning_code, -> { Plaid::Types::WarningWarningCode }, optional: false, nullable: false

      field :cause, -> { Plaid::Types::Cause }, optional: false, nullable: true
    end
  end
end
