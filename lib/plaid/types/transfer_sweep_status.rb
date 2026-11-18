# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransferSweepStatus
      extend Plaid::Internal::Types::Enum

      UNSWEPT = "unswept"
      SWEPT = "swept"
      SWEPT_SETTLED = "swept_settled"
      RETURN_SWEPT = "return_swept"
    end
  end
end
