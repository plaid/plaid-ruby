# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ProcessorTokenPermissionsSetResponse defines the response schema for `/processor/token/permissions/set`
    class ProcessorTokenPermissionsSetResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
