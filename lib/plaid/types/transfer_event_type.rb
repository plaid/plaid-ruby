# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransferEventType
      extend Plaid::Internal::Types::Enum

      PENDING = "pending"
      CANCELLED = "cancelled"
      FAILED = "failed"
      POSTED = "posted"
      SETTLED = "settled"
      FUNDS_AVAILABLE = "funds_available"
      GUARANTEED = "guaranteed"
      RETURNED = "returned"
      ADJUSTMENT = "adjustment"
      GUARANTEE_REIMBURSED = "guarantee_reimbursed"
      CLIENT_RETURN_RECOVERED = "client_return_recovered"
      PLAID_RETURN_RECOVERED = "plaid_return_recovered"
      SWEPT = "swept"
      SWEPT_SETTLED = "swept_settled"
      RETURN_SWEPT = "return_swept"
      SWEEP_PENDING = "sweep.pending"
      SWEEP_POSTED = "sweep.posted"
      SWEEP_SETTLED = "sweep.settled"
      SWEEP_RETURNED = "sweep.returned"
      SWEEP_FAILED = "sweep.failed"
      SWEEP_FUNDS_AVAILABLE = "sweep.funds_available"
      REFUND_PENDING = "refund.pending"
      REFUND_CANCELLED = "refund.cancelled"
      REFUND_FAILED = "refund.failed"
      REFUND_POSTED = "refund.posted"
      REFUND_SETTLED = "refund.settled"
      REFUND_RETURNED = "refund.returned"
      REFUND_SWEPT = "refund.swept"
      REFUND_RETURN_SWEPT = "refund.return_swept"
    end
  end
end
