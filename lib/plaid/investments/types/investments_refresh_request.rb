# frozen_string_literal: true

module Plaid
  module Investments
    module Types
      class InvestmentsRefreshRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end
