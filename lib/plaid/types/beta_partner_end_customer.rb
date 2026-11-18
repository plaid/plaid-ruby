# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The details for an end customer.
    class BetaPartnerEndCustomer < Internal::Types::Model
      field :client_id, -> { String }, optional: true, nullable: false

      field :company_name, -> { String }, optional: true, nullable: false

      field :status, -> { Plaid::Types::PartnerEndCustomerStatus }, optional: true, nullable: false

      field :product_statuses, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :requirements_due, -> { Internal::Types::Array[Plaid::Types::PartnerEndCustomerRequirementDue] }, optional: true, nullable: false
    end
  end
end
