# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The business the data provider matched, and the records it holds for it. When there is no business search result,
    # for example when only industry classification ran, every scalar is `null` and every list is empty.
    # `incorporation_date` is the date the business was incorporated, or `null` when not available.
    class BusinessDetails < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: true

      field :alternative_names, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :entity_type, -> { Plaid::Types::BusinessEntityType }, optional: false, nullable: true

      field :incorporation_date, -> { String }, optional: false, nullable: true

      field :incorporation_jurisdiction, -> { String }, optional: false, nullable: true

      field :addresses, -> { Internal::Types::Array[Plaid::Types::BusinessDetailAddress] }, optional: false, nullable: false

      field :phone_numbers, -> { Internal::Types::Array[Plaid::Types::BusinessPhoneNumber] }, optional: false, nullable: false

      field :email_addresses, -> { Internal::Types::Array[Plaid::Types::BusinessEmailAddress] }, optional: false, nullable: false

      field :websites, -> { Internal::Types::Array[Plaid::Types::BusinessWebsite] }, optional: false, nullable: false

      field :officers, -> { Internal::Types::Array[Plaid::Types::BusinessDetailOfficer] }, optional: false, nullable: false

      field :registrations, -> { Internal::Types::Array[Plaid::Types::BusinessRegistration] }, optional: false, nullable: false

      field :industry, -> { Plaid::Types::BusinessIndustry }, optional: false, nullable: false

      field :sec_registrations, -> { Internal::Types::Array[Plaid::Types::BusinessSecRegistration] }, optional: false, nullable: false
    end
  end
end
