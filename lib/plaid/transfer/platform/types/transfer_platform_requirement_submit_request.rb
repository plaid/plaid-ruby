# frozen_string_literal: true

module Plaid
  module Transfer
    module Platform
      module Types
        class TransferPlatformRequirementSubmitRequest < Internal::Types::Model
          field :originator_client_id, -> { String }, optional: false, nullable: false

          field :requirement_submissions, -> { Internal::Types::Array[Plaid::Types::TransferPlatformRequirementSubmission] }, optional: false, nullable: false
        end
      end
    end
  end
end
