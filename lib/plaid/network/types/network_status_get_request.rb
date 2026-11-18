# frozen_string_literal: true

module Plaid
  module Network
    module Types
      class NetworkStatusGetRequest < Internal::Types::Model
        field :user, -> { Plaid::Types::NetworkStatusGetUser }, optional: false, nullable: false

        field :template_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
