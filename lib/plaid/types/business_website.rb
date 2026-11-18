# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Website associated with a business
    class BusinessWebsite < Internal::Types::Model
      field :url, -> { String }, optional: false, nullable: true
    end
  end
end
