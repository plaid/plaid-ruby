# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The legal name and other information for the account holder.
    class BankTransferUser < Internal::Types::Model
      field :legal_name, -> { String }, optional: false, nullable: false

      field :email_address, -> { String }, optional: true, nullable: true

      field :routing_number, -> { String }, optional: true, nullable: false
    end
  end
end
