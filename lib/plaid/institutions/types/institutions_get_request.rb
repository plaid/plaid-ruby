# frozen_string_literal: true

module Plaid
  module Institutions
    module Types
      class InstitutionsGetRequest < Internal::Types::Model
        field :count, -> { Integer }, optional: false, nullable: false

        field :offset, -> { Integer }, optional: false, nullable: false

        field :country_codes, -> { Internal::Types::Array[Plaid::Types::CountryCode] }, optional: false, nullable: false

        field :options, -> { Plaid::Types::InstitutionsGetRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
