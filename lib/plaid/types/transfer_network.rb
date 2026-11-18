# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransferNetwork
      extend Plaid::Internal::Types::Enum

      ACH = "ach"
      SAME_DAY_ACH = "same-day-ach"
      RTP = "rtp"
      WIRE = "wire"
      RFP = "rfp"
    end
  end
end
