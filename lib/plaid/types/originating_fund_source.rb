# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The original source of the funds. This field is required by local regulation for certain businesses (e.g. money
    # remittance) to send payouts to recipients in the EU and UK.
    class OriginatingFundSource < Internal::Types::Model
      field :full_name, -> { String }, optional: false, nullable: false

      field :address, -> { Plaid::Types::PaymentInitiationAddress }, optional: false, nullable: true

      field :account_number, -> { String }, optional: false, nullable: false

      field :bic, -> { String }, optional: false, nullable: false
    end
  end
end
