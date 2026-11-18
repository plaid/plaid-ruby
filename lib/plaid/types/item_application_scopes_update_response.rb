# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ItemApplicationScopesUpdateResponse defines the response schema for `/item/application/scopes/update`
    class ItemApplicationScopesUpdateResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
