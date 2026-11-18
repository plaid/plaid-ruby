# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ProcessorTokenWebhookUpdateResponse defines the response schema for `/processor/token/webhook/update`
    class ProcessorTokenWebhookUpdateResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
