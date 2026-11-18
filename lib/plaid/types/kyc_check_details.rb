# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Additional information for the `kyc_check` (Data Source Verification) step. This field will be `null` unless
    # `steps.kyc_check` has reached a terminal state of `success`, `failed`, `manually_approved`, or
    # `manually_rejected`.
    class KycCheckDetails < Internal::Types::Model
      field :status, -> { String }, optional: false, nullable: false

      field :address, -> { Plaid::Types::KycCheckAddressSummary }, optional: false, nullable: false

      field :name, -> { Plaid::Types::KycCheckNameSummary }, optional: false, nullable: false

      field :date_of_birth, -> { Plaid::Types::KycCheckDateOfBirthSummary }, optional: false, nullable: false

      field :id_number, -> { Plaid::Types::KycCheckIDNumberSummary }, optional: false, nullable: false

      field :phone_number, -> { Plaid::Types::KycCheckPhoneSummary }, optional: false, nullable: false
    end
  end
end
