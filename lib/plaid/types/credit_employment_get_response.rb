# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CreditEmploymentGetResponse defines the response schema for `/credit/employment/get`.
    class CreditEmploymentGetResponse < Internal::Types::Model
      field :items, -> { Internal::Types::Array[Plaid::Types::CreditEmploymentItem] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
