# frozen_string_literal: true

module Plaid
  module Liabilities
    module Types
      class LiabilitiesGetRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :options, -> { Plaid::Types::LiabilitiesGetRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
