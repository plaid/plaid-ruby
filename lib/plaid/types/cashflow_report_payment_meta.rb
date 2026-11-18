# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Transaction information specific to inter-bank transfers. If the transaction was not an inter-bank transfer, all
    # fields will be `null`.
    class CashflowReportPaymentMeta < Internal::Types::Model
      field :reference_number, -> { String }, optional: false, nullable: true

      field :ppd_id, -> { String }, optional: false, nullable: true

      field :payee, -> { String }, optional: false, nullable: true

      field :by_order_of, -> { String }, optional: false, nullable: true

      field :payer, -> { String }, optional: false, nullable: true

      field :payment_method, -> { String }, optional: false, nullable: true

      field :payment_processor, -> { String }, optional: false, nullable: true

      field :reason, -> { String }, optional: false, nullable: true
    end
  end
end
