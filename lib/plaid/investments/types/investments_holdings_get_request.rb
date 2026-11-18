# frozen_string_literal: true

module Plaid
  module Investments
    module Types
      class InvestmentsHoldingsGetRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :options, -> { Plaid::Types::InvestmentHoldingsGetRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
