# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A registration of the business with a US state, as the data provider reported it. `issue_date`, `inactive_date`,
    # and `dissolution_date` are each `null` when not available.
    class BusinessRegistration < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: true

      field :file_number, -> { String }, optional: false, nullable: true

      field :jurisdiction, -> { String }, optional: false, nullable: true

      field :type, -> { Plaid::Types::BusinessRegistrationType }, optional: false, nullable: true

      field :status, -> { Plaid::Types::BusinessRegistrationStatus }, optional: false, nullable: true

      field :standing, -> { String }, optional: false, nullable: true

      field :issue_date, -> { String }, optional: false, nullable: true

      field :inactive_date, -> { String }, optional: false, nullable: true

      field :dissolution_date, -> { String }, optional: false, nullable: true

      field :address, -> { Plaid::Types::BusinessRegistrationAddressNullable }, optional: false, nullable: true

      field :registered_agent, -> { Plaid::Types::BusinessRegisteredAgent }, optional: false, nullable: true

      field :officers, -> { Internal::Types::Array[Plaid::Types::BusinessRegistrationOfficer] }, optional: false, nullable: false
    end
  end
end
