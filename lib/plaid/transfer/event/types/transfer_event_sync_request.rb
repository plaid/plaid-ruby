# frozen_string_literal: true

module Plaid
  module Transfer
    module Event
      module Types
        class TransferEventSyncRequest < Internal::Types::Model
          field :after_id, -> { Integer }, optional: false, nullable: false

          field :count, -> { Integer }, optional: true, nullable: true
        end
      end
    end
  end
end
