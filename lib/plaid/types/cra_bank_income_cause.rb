# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An error object and associated `item_id` used to identify a specific Item and error when a batch operation
    # operating on multiple Items has encountered an error in one of the Items.
    class CraBankIncomeCause < Internal::Types::Model
      field :error_type, -> { Plaid::Types::CreditBankIncomeErrorType }, optional: false, nullable: false

      field :error_code, -> { String }, optional: false, nullable: false

      field :error_message, -> { String }, optional: false, nullable: false

      field :display_message, -> { String }, optional: false, nullable: false
    end
  end
end
