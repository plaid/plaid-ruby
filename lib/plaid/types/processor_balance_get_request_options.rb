# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Optional parameters to `/processor/balance/get`.
    class ProcessorBalanceGetRequestOptions < Internal::Types::Model
      field :min_last_updated_datetime, -> { String }, optional: true, nullable: false
    end
  end
end
