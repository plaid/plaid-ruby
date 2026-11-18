# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ApplicationGetResponse defines the response schema for `/application/get`
    class ApplicationGetResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false

      field :application, -> { Plaid::Types::Application }, optional: false, nullable: false
    end
  end
end
