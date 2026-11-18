# frozen_string_literal: true

module Plaid
  module Signal
    module Types
      class SignalPrepareRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end
