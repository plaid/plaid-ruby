# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The details of a bank employment verification in Link.
    class CreditSessionBankEmploymentResult < Internal::Types::Model
      field :status, -> { Plaid::Types::CreditSessionBankEmploymentStatus }, optional: true, nullable: false

      field :item_id, -> { String }, optional: true, nullable: false

      field :institution_id, -> { String }, optional: true, nullable: false
    end
  end
end
