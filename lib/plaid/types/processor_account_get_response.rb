# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ProcessorAccountGetResponse defines the response schema for `/processor/account/get`
    class ProcessorAccountGetResponse < Internal::Types::Model
      field :account, -> { Plaid::Types::AccountBase }, optional: false, nullable: false

      field :institution_id, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
