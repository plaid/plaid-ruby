# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ProcessorLiabilitiesGetResponse defines the response schema for `/processor/liabilities/get`
    class ProcessorLiabilitiesGetResponse < Internal::Types::Model
      field :account, -> { Plaid::Types::AccountBase }, optional: false, nullable: false

      field :liabilities, -> { Plaid::Types::LiabilitiesObject }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
