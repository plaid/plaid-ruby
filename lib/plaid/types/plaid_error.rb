# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Errors are identified by `error_code` and categorized by `error_type`. Use these in preference to HTTP status
    # codes to identify and handle specific errors. HTTP status codes are set and provide the broadest categorization of
    # errors: 4xx codes are for developer- or user-related errors, and 5xx codes are for Plaid-related errors, and the
    # status will be 2xx in non-error cases. An Item with a non-`null` error object will only be part of an API response
    # when calling `/item/get` to view Item status. Otherwise, error fields will be `null` if no error has occurred; if
    # an error has occurred, an error code will be returned instead.
    class PlaidError < Internal::Types::Model
      field :error_type, -> { Plaid::Types::PlaidErrorType }, optional: false, nullable: false

      field :error_code, -> { String }, optional: false, nullable: false

      field :error_code_reason, -> { String }, optional: true, nullable: true

      field :error_message, -> { String }, optional: false, nullable: false

      field :display_message, -> { String }, optional: false, nullable: true

      field :request_id, -> { String }, optional: true, nullable: false

      field :causes, -> { Internal::Types::Array[Object] }, optional: true, nullable: false

      field :status, -> { Integer }, optional: true, nullable: true

      field :documentation_url, -> { String }, optional: true, nullable: false

      field :suggested_action, -> { String }, optional: true, nullable: true

      field :required_account_subtypes, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :provided_account_subtypes, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
