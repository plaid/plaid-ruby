# frozen_string_literal: true

module Plaid
  module Processor
    module Types
      class ProcessorTransactionsRecurringGetRequest < Internal::Types::Model
        field :processor_token, -> { String }, optional: false, nullable: false

        field :options, -> { Plaid::Types::TransactionsRecurringGetRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
