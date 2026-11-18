# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object specifying the arguments originally provided to the `/link/token/create` call.
    class LinkTokenGetMetadataResponse < Internal::Types::Model
      field :initial_products, -> { Internal::Types::Array[Plaid::Types::Products] }, optional: false, nullable: false

      field :webhook, -> { String }, optional: false, nullable: true

      field :country_codes, -> { Internal::Types::Array[Plaid::Types::CountryCode] }, optional: false, nullable: false

      field :language, -> { String }, optional: false, nullable: true

      field :institution_data, -> { Plaid::Types::LinkTokenCreateInstitutionData }, optional: true, nullable: true

      field :account_filters, -> { Plaid::Types::AccountFiltersResponse }, optional: true, nullable: true

      field :redirect_uri, -> { String }, optional: false, nullable: true

      field :client_name, -> { String }, optional: false, nullable: true
    end
  end
end
