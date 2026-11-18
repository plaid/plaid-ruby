# frozen_string_literal: true

module Plaid
  module Transfer
    module Intent
      module Types
        class TransferIntentGetRequest < Internal::Types::Model
          field :transfer_intent_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
