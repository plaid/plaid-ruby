# frozen_string_literal: true

module Plaid
  module BankTransfer
    module Types
      class BankTransferListRequest < Internal::Types::Model
        field :start_date, -> { String }, optional: true, nullable: true

        field :end_date, -> { String }, optional: true, nullable: true

        field :count, -> { Integer }, optional: true, nullable: false

        field :offset, -> { Integer }, optional: true, nullable: false

        field :origination_account_id, -> { String }, optional: true, nullable: true

        field :direction, -> { Plaid::Types::BankTransferDirection }, optional: true, nullable: true
      end
    end
  end
end
