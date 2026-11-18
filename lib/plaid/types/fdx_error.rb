# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Error response for the FDX Consent API. These endpoints use the FDX error format rather than Plaid's standard
    # error object.
    class FdxError < Internal::Types::Model
      field :error_type, -> { String }, optional: false, nullable: false

      field :error_code, -> { String }, optional: false, nullable: false

      field :error_message, -> { String }, optional: false, nullable: false
    end
  end
end
