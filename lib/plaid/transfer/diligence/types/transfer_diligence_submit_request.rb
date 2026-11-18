# frozen_string_literal: true

module Plaid
  module Transfer
    module Diligence
      module Types
        class TransferDiligenceSubmitRequest < Internal::Types::Model
          field :originator_client_id, -> { String }, optional: false, nullable: false

          field :originator_diligence, -> { Plaid::Types::TransferOriginatorDiligence }, optional: false, nullable: false
        end
      end
    end
  end
end
