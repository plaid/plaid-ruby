# frozen_string_literal: true

module Plaid
  module BeaconDuplicate
    module Types
      class BeaconDuplicateGetRequest < Internal::Types::Model
        field :beacon_duplicate_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
