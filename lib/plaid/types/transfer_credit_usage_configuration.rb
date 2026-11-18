# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specifies the originator's expected usage of credits. For all dollar amounts, use a decimal string with two digits
    # of precision e.g. "10.00". This field is required if the originator is expected to process credit transfers.
    class TransferCreditUsageConfiguration < Internal::Types::Model
      field :expected_frequency, -> { Plaid::Types::OriginatorExpectedTransferFrequency }, optional: false, nullable: false

      field :expected_highest_amount, -> { String }, optional: false, nullable: false

      field :expected_average_amount, -> { String }, optional: false, nullable: false

      field :expected_monthly_amount, -> { String }, optional: false, nullable: false

      field :sec_codes, -> { Internal::Types::Array[Plaid::Types::CreditAchClass] }, optional: false, nullable: false
    end
  end
end
