# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/originator/create`
    class TransferOriginatorCreateResponse < Internal::Types::Model
      field :originator_client_id, -> { String }, optional: false, nullable: false

      field :company_name, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
