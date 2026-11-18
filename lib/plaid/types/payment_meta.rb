# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Transaction information specific to inter-bank transfers. If the transaction was not an inter-bank transfer, all
    # fields will be `null`.
    #
    # If the `transactions` object was returned by a Transactions endpoint such as `/transactions/sync` or
    # `/transactions/get`, the `payment_meta` key will always appear, but no data elements are guaranteed. If the
    # `transactions` object was returned by an Assets endpoint such as `/asset_report/get` or `/asset_report/pdf/get`,
    # this field will only appear in an Asset Report with Insights.
    class PaymentMeta < Internal::Types::Model
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
