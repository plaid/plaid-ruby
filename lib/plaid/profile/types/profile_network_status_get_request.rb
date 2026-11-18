# frozen_string_literal: true

module Plaid
  module Profile
    module Types
      class ProfileNetworkStatusGetRequest < Internal::Types::Model
        field :user, -> { Plaid::Types::NetworkStatusGetUser }, optional: false, nullable: false
      end
    end
  end
end
