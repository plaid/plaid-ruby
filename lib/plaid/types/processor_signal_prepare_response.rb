# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ProcessorSignalPrepareResponse defines the response schema for `/processor/signal/prepare`
    class ProcessorSignalPrepareResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
