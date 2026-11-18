# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The registered agent the data provider listed on the registration. `null` when the provider listed none.
    class BusinessRegisteredAgent < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: true

      field :address, -> { Plaid::Types::BusinessRegistrationAddressNullable }, optional: false, nullable: true
    end
  end
end
