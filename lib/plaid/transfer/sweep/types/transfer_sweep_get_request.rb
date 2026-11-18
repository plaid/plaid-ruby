# frozen_string_literal: true

module Plaid
  module Transfer
    module Sweep
      module Types
        class TransferSweepGetRequest < Internal::Types::Model
          field :sweep_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
