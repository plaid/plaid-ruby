# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The OAuth registration information for an institution.
    class PartnerEndCustomerOAuthInstitution < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false

      field :institution_id, -> { String }, optional: true, nullable: false

      field :environments, -> { Plaid::Types::PartnerEndCustomerOAuthInstitutionEnvironments }, optional: true, nullable: false

      field :production_enablement_date, -> { String }, optional: true, nullable: true

      field :classic_disablement_date, -> { String }, optional: true, nullable: true

      field :errors, -> { Internal::Types::Array[Plaid::Types::PlaidError] }, optional: true, nullable: false
    end
  end
end
