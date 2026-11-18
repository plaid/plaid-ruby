# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/platform/person/create`
    class TransferPlatformPersonCreateResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false

      field :person_id, -> { String }, optional: false, nullable: false
    end
  end
end
