# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The details for the newly created end customer, including secrets for non-Production environments.
    class PartnerEndCustomerWithSecrets < Internal::Types::Model
      field :client_id, -> { String }, optional: true, nullable: false

      field :company_name, -> { String }, optional: true, nullable: false

      field :status, -> { Plaid::Types::PartnerEndCustomerStatus }, optional: true, nullable: false

      field :secrets, -> { Plaid::Types::PartnerEndCustomerSecrets }, optional: true, nullable: false
    end
  end
end
