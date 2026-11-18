# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ProcessorAuthGetResponse defines the response schema for `/processor/auth/get`
    class ProcessorAuthGetResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false

      field :numbers, -> { Plaid::Types::ProcessorNumber }, optional: false, nullable: false

      field :account, -> { Plaid::Types::AccountBase }, optional: false, nullable: false
    end
  end
end
