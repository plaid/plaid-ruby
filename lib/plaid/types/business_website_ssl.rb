# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # SSL status for the business website.
    class BusinessWebsiteSsl < Internal::Types::Model
      field :is_valid, -> { Plaid::Types::BusinessCheckBooleanStatus }, optional: false, nullable: false
    end
  end
end
