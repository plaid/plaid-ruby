# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Response data for `/session/token/create` intended for use with the Link SDK.
    class SessionTokenCreateResponseLink < Internal::Types::Model
      field :link_token, -> { String }, optional: false, nullable: false

      field :expiration, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false
    end
  end
end
