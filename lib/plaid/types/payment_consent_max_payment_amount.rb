# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PaymentConsentMaxPaymentAmount
      # PaymentConsentMaxPaymentAmount is an alias for PaymentAmount

      # @option str [String]
      #
      # @return [untyped]
      def self.load(str)
        Plaid::Types::PaymentAmount.load(str)
      end

      # @option value [untyped]
      #
      # @return [String]
      def self.dump(value)
        ::JSON.generate(value)
      end
    end
  end
end
