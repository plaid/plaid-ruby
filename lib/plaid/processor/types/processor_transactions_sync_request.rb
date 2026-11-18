# frozen_string_literal: true

module Plaid
  module Processor
    module Types
      class ProcessorTransactionsSyncRequest < Internal::Types::Model
        field :processor_token, -> { String }, optional: false, nullable: false

        field :cursor, -> { String }, optional: true, nullable: false

        field :count, -> { Integer }, optional: true, nullable: false

        field :options, -> { Plaid::Types::TransactionsSyncRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
