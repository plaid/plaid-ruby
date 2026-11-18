# frozen_string_literal: true

module Plaid
  module Transfer
    module Originator
      module Types
        class TransferOriginatorCreateRequest < Internal::Types::Model
          field :company_name, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
