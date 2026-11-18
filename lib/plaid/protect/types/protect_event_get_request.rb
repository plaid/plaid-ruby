# frozen_string_literal: true

module Plaid
  module Protect
    module Types
      class ProtectEventGetRequest < Internal::Types::Model
        field :event_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
