# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Response object for `/protect/cash_advance/repayment/create`.
    class ProtectCashAdvanceRepaymentCreateResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
