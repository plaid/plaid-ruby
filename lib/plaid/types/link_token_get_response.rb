# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # LinkTokenGetResponse defines the response schema for `/link/token/get`
    class LinkTokenGetResponse < Internal::Types::Model
      field :link_token, -> { String }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: true

      field :expiration, -> { String }, optional: false, nullable: true

      field :link_sessions, -> { Internal::Types::Array[Plaid::Types::LinkTokenGetSessionsResponse] }, optional: true, nullable: false

      field :metadata, -> { Plaid::Types::LinkTokenGetMetadataResponse }, optional: false, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
