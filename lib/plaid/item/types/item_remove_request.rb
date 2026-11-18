# frozen_string_literal: true

module Plaid
  module Item
    module Types
      class ItemRemoveRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :reason_code, -> { Plaid::Types::ItemRemoveReasonCode }, optional: true, nullable: true

        field :reason_note, -> { String }, optional: true, nullable: true
      end
    end
  end
end
