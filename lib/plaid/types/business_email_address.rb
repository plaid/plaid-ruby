# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Email address associated with a business
    class BusinessEmailAddress < Internal::Types::Model
      field :email_address, -> { String }, optional: false, nullable: true
    end
  end
end
