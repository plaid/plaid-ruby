# frozen_string_literal: true

module Plaid
  module Protect
    module Types
      class ProtectUserInsightsGetRequest < Internal::Types::Model
        field :user_id, -> { String }, optional: true, nullable: false

        field :client_user_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
