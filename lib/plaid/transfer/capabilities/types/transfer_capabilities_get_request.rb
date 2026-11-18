# frozen_string_literal: true

module Plaid
  module Transfer
    module Capabilities
      module Types
        class TransferCapabilitiesGetRequest < Internal::Types::Model
          field :access_token, -> { String }, optional: false, nullable: false

          field :account_id, -> { String }, optional: false, nullable: false

          field :payment_profile_token, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
