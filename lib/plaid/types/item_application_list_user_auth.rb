# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # User authentication parameters, for clients making a request without an `access_token`. This is only allowed for
    # select clients and will not be supported in the future. Most clients should call `/item/import` to obtain an
    # access token before making a request.
    class ItemApplicationListUserAuth < Internal::Types::Model
      field :user_id, -> { String }, optional: true, nullable: true

      field :fi_username_hash, -> { String }, optional: true, nullable: true
    end
  end
end
