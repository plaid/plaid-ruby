# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The billing contact for the end customer. Defaults to partner's billing contact if omitted.
    class PartnerEndCustomerBillingContact < Internal::Types::Model
      field :given_name, -> { String }, optional: true, nullable: false

      field :family_name, -> { String }, optional: true, nullable: false

      field :email, -> { String }, optional: true, nullable: false
    end
  end
end
