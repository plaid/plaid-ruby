# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details about the end user initiating the transaction (i.e., the account holder). These fields are optional, but
    # strongly recommended to increase the accuracy of results when using Signal Transaction Scores. When using a
    # Balance-only ruleset, these fields are ignored.
    class SignalUser < Internal::Types::Model
      field :name, -> { Plaid::Types::SignalPersonName }, optional: true, nullable: true

      field :phone_number, -> { String }, optional: true, nullable: true

      field :email_address, -> { String }, optional: true, nullable: true

      field :address, -> { Plaid::Types::SignalAddressData }, optional: true, nullable: true
    end
  end
end
