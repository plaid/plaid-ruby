# frozen_string_literal: true

module Plaid
  module Processor
    module Types
      class ProcessorBalanceGetRequest < Internal::Types::Model
        field :processor_token, -> { String }, optional: false, nullable: false

        field :options, -> { Plaid::Types::ProcessorBalanceGetRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
