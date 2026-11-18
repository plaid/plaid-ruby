# frozen_string_literal: true

module Plaid
  module Transfer
    module Metrics
      module Types
        class TransferMetricsGetRequest < Internal::Types::Model
          field :originator_client_id, -> { String }, optional: true, nullable: true
        end
      end
    end
  end
end
