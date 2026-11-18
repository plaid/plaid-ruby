# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransferCreditFundsSource
      extend Plaid::Internal::Types::Enum

      SWEEP = "sweep"
      PREFUNDED_RTP_CREDITS = "prefunded_rtp_credits"
      PREFUNDED_ACH_CREDITS = "prefunded_ach_credits"
    end
  end
end
