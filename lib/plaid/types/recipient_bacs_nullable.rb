# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object containing a Bacs account number and sort code. If an IBAN is not provided or if this recipient needs to
    # accept domestic GBP-denominated payments, Bacs data is required.
    class RecipientBacsNullable < Internal::Types::Model
      field :account, -> { String }, optional: true, nullable: false

      field :sort_code, -> { String }, optional: true, nullable: false
    end
  end
end
