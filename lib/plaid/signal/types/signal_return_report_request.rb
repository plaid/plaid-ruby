# frozen_string_literal: true

module Plaid
  module Signal
    module Types
      class SignalReturnReportRequest < Internal::Types::Model
        field :client_transaction_id, -> { String }, optional: false, nullable: false

        field :return_code, -> { String }, optional: false, nullable: false

        field :returned_at, -> { String }, optional: true, nullable: true
      end
    end
  end
end
