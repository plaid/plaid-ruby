# frozen_string_literal: true

module Plaid
  module Employers
    module Types
      class EmployersSearchRequest < Internal::Types::Model
        field :query, -> { String }, optional: false, nullable: false

        field :products, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      end
    end
  end
end
