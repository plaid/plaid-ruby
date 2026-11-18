# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information about the user whose eligibility is being evaluated.
    class IncomeVerificationPrecheckUser < Internal::Types::Model
      field :first_name, -> { String }, optional: true, nullable: true

      field :last_name, -> { String }, optional: true, nullable: true

      field :email_address, -> { String }, optional: true, nullable: true

      field :home_address, -> { Plaid::Types::SignalAddressData }, optional: true, nullable: true
    end
  end
end
