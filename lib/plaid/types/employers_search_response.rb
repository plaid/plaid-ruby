# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # EmployersSearchResponse defines the response schema for `/employers/search`.
    class EmployersSearchResponse < Internal::Types::Model
      field :employers, -> { Internal::Types::Array[Plaid::Types::Employer] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
