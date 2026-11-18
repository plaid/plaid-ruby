# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The bank addendum acceptance for the end customer.
    class PartnerEndCustomerBankAddendumAcceptance < Internal::Types::Model
      field :customer_accepted, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :customer_ip_address, -> { String }, optional: true, nullable: false

      field :customer_agreement_timestamp, -> { String }, optional: true, nullable: false
    end
  end
end
