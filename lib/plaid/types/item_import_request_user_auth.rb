# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Object of user ID and auth token pair, permitting Plaid to aggregate a user's accounts
    class ItemImportRequestUserAuth < Internal::Types::Model
      field :user_id, -> { String }, optional: false, nullable: false

      field :auth_token, -> { String }, optional: true, nullable: false
    end
  end
end
