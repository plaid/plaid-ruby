# frozen_string_literal: true

module Plaid
  module Transfer
    module Configuration
      module Types
        class TransferConfigurationGetRequest < Internal::Types::Model
          field :originator_client_id, -> { String }, optional: true, nullable: true
        end
      end
    end
  end
end
