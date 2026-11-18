# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A related Standard Industrial Classification (SIC) code and its description.
    class BusinessStandardIndustrialClassificationCode < Internal::Types::Model
      field :code, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: true
    end
  end
end
