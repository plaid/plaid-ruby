# frozen_string_literal: true

module Plaid
  module Institutions
    module Types
      class InstitutionsSearchRequest < Internal::Types::Model
        field :query, -> { String }, optional: false, nullable: false

        field :products, -> { Internal::Types::Array[Plaid::Types::Products] }, optional: true, nullable: true

        field :country_codes, -> { Internal::Types::Array[Plaid::Types::CountryCode] }, optional: false, nullable: false

        field :options, -> { Plaid::Types::InstitutionsSearchRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
