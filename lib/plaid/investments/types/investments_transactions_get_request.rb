# frozen_string_literal: true

module Plaid
  module Investments
    module Types
      class InvestmentsTransactionsGetRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :start_date, -> { String }, optional: false, nullable: false

        field :end_date, -> { String }, optional: false, nullable: false

        field :options, -> { Plaid::Types::InvestmentsTransactionsGetRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
