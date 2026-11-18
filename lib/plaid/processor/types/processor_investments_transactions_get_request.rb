# frozen_string_literal: true

module Plaid
  module Processor
    module Types
      class ProcessorInvestmentsTransactionsGetRequest < Internal::Types::Model
        field :options, -> { Plaid::Types::InvestmentsTransactionsGetRequestOptions }, optional: true, nullable: false

        field :processor_token, -> { String }, optional: false, nullable: false

        field :start_date, -> { String }, optional: false, nullable: false

        field :end_date, -> { String }, optional: false, nullable: false
      end
    end
  end
end
