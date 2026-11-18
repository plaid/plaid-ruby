# frozen_string_literal: true

module Plaid
  module Investments
    module Types
      class InvestmentsAuthGetRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :options, -> { Plaid::Types::InvestmentsAuthGetRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
