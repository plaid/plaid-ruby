# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The business information that was used to perform the verification search
    class BusinessSearchTerms < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: true

      field :alternative_names, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :address, -> { Plaid::Types::ResponseBusinessAddress }, optional: false, nullable: false

      field :website, -> { String }, optional: false, nullable: true

      field :phone_number, -> { String }, optional: false, nullable: true

      field :email_address, -> { String }, optional: false, nullable: true

      field :tin, -> { String }, optional: false, nullable: true

      field :officers, -> { Internal::Types::Array[Plaid::Types::BusinessOfficer] }, optional: false, nullable: false
    end
  end
end
