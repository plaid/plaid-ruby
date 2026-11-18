# frozen_string_literal: true

module Plaid
  module Protect
    module Types
      class ProtectCashAdvanceRepaymentCreateRequest < Internal::Types::Model
        field :user, -> { Plaid::Types::ProtectUser }, optional: false, nullable: false

        field :client_advance_id, -> { String }, optional: false, nullable: false

        field :status, -> { Plaid::Types::CashAdvanceRepaymentStatus }, optional: false, nullable: false

        field :repayment_time, -> { String }, optional: true, nullable: true

        field :repayment, -> { Plaid::Types::CashAdvanceRepayment }, optional: false, nullable: false
      end
    end
  end
end
