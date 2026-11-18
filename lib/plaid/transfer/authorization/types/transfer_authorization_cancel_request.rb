# frozen_string_literal: true

module Plaid
  module Transfer
    module Authorization
      module Types
        class TransferAuthorizationCancelRequest < Internal::Types::Model
          field :authorization_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
