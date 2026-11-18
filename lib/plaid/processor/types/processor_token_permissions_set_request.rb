# frozen_string_literal: true

module Plaid
  module Processor
    module Types
      class ProcessorTokenPermissionsSetRequest < Internal::Types::Model
        field :processor_token, -> { String }, optional: false, nullable: false

        field :products, -> { Internal::Types::Array[Plaid::Types::Products] }, optional: false, nullable: false
      end
    end
  end
end
