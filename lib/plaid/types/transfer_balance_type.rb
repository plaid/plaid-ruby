# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransferBalanceType
      extend Plaid::Internal::Types::Enum

      PREFUNDED_RTP_CREDITS = "prefunded_rtp_credits"
      PREFUNDED_ACH_CREDITS = "prefunded_ach_credits"
    end
  end
end
