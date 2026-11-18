# frozen_string_literal: true

module Plaid
  module Processor
    module Types
      class ProcessorTokenWebhookUpdateRequest < Internal::Types::Model
        field :processor_token, -> { String }, optional: false, nullable: false

        field :webhook, -> { String }, optional: false, nullable: true
      end
    end
  end
end
