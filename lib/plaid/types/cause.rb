# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An error object and associated `item_id` used to identify a specific Item and error when a batch operation
    # operating on multiple Items has encountered an error in one of the Items.
    class Cause < Internal::Types::Model
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

      field :item_id, -> { String }, optional: false, nullable: false
    end
  end
end
