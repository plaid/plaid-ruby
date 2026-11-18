# frozen_string_literal: true

module Plaid
  module Transfer
    module Originator
      module Types
        class TransferOriginatorFundingAccountCreateRequest < Internal::Types::Model
          field :originator_client_id, -> { String }, optional: false, nullable: false

          field :funding_account, -> { Plaid::Types::TransferFundingAccountWithDisplayName }, optional: false, nullable: false
        end
      end
    end
  end
end
