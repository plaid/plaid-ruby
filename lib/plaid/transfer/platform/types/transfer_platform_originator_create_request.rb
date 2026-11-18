# frozen_string_literal: true

module Plaid
  module Transfer
    module Platform
      module Types
        class TransferPlatformOriginatorCreateRequest < Internal::Types::Model
          field :originator_client_id, -> { String }, optional: false, nullable: false

          field :tos_acceptance_metadata, -> { Plaid::Types::TransferPlatformTosAcceptanceMetadata }, optional: false, nullable: false

          field :originator_reviewed_at, -> { String }, optional: false, nullable: false

          field :webhook, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
