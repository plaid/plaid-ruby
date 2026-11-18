# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # LinkTokenCreateResponse defines the response schema for `/link/token/create`
    class LinkTokenCreateResponse < Internal::Types::Model
      field :link_token, -> { String }, optional: false, nullable: false

      field :expiration, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false

      field :hosted_link_url, -> { String }, optional: true, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false
    end
  end
end
