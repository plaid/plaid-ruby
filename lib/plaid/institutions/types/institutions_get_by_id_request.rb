# frozen_string_literal: true

module Plaid
  module Institutions
    module Types
      class InstitutionsGetByIDRequest < Internal::Types::Model
        field :institution_id, -> { String }, optional: false, nullable: false

        field :country_codes, -> { Internal::Types::Array[Plaid::Types::CountryCode] }, optional: false, nullable: false

        field :options, -> { Plaid::Types::InstitutionsGetByIDRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
