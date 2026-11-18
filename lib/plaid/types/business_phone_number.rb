# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Phone number associated with a business
    class BusinessPhoneNumber < Internal::Types::Model
      field :number, -> { String }, optional: false, nullable: true
    end
  end
end
