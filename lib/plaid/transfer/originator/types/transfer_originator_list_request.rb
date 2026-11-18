# frozen_string_literal: true

module Plaid
  module Transfer
    module Originator
      module Types
        class TransferOriginatorListRequest < Internal::Types::Model
          field :count, -> { Integer }, optional: true, nullable: true

          field :offset, -> { Integer }, optional: true, nullable: true
        end
      end
    end
  end
end
