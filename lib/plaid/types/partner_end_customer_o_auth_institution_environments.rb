# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Registration statuses by environment.
    class PartnerEndCustomerOAuthInstitutionEnvironments < Internal::Types::Model
      field :development, -> { Plaid::Types::PartnerEndCustomerOAuthInstitutionApplicationStatus }, optional: true, nullable: false

      field :production, -> { Plaid::Types::PartnerEndCustomerOAuthInstitutionApplicationStatus }, optional: true, nullable: false
    end
  end
end
