# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Business information provided in the verification request
    class BusinessVerificationCreateRequestBusiness < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :alternative_name, -> { String }, optional: true, nullable: true

      field :address, -> { Plaid::Types::RequestBusinessAddress }, optional: false, nullable: false

      field :website, -> { String }, optional: true, nullable: false

      field :phone_number, -> { String }, optional: true, nullable: false

      field :email_address, -> { String }, optional: true, nullable: false

      field :tin, -> { String }, optional: true, nullable: true

      field :officers, -> { Internal::Types::Array[Plaid::Types::BusinessOfficer] }, optional: true, nullable: true
    end
  end
end
