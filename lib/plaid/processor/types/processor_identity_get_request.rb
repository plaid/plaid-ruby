# frozen_string_literal: true

module Plaid
  module Processor
    module Types
      class ProcessorIdentityGetRequest < Internal::Types::Model
        field :processor_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end
