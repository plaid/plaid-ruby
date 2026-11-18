# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/authorization/create`
    class TransferAuthorizationCreateResponse < Internal::Types::Model
      field :authorization, -> { Plaid::Types::TransferAuthorization }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
