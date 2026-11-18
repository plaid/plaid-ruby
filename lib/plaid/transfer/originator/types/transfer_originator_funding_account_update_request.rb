# frozen_string_literal: true

module Plaid
  module Transfer
    module Originator
      module Types
        class TransferOriginatorFundingAccountUpdateRequest < Internal::Types::Model
          field :originator_client_id, -> { String }, optional: false, nullable: false

          field :funding_account, -> { Plaid::Types::TransferFundingAccount }, optional: false, nullable: false
        end
      end
    end
  end
end
