# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The technical contact for the end customer. Defaults to partner's technical contact if omitted.
    class PartnerEndCustomerTechnicalContact < Internal::Types::Model
      field :given_name, -> { String }, optional: true, nullable: false

      field :family_name, -> { String }, optional: true, nullable: false

      field :email, -> { String }, optional: true, nullable: false
    end
  end
end
