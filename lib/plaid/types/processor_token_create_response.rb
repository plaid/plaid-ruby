# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ProcessorTokenCreateResponse defines the response schema for `/processor/token/create` and
    # `/processor/apex/processor_token/create`
    class ProcessorTokenCreateResponse < Internal::Types::Model
      field :processor_token, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
