# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The legal name and other information for the account holder.
    class TransferUserInResponse < Internal::Types::Model
      field :legal_name, -> { String }, optional: false, nullable: false

      field :phone_number, -> { String }, optional: false, nullable: true

      field :email_address, -> { String }, optional: false, nullable: true

      field :address, -> { Plaid::Types::TransferUserAddressInResponse }, optional: false, nullable: true
    end
  end
end
