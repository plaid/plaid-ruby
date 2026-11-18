# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Results from a Social Security Administration (SSA) electronic Consent Based Social Security Number Verification
    # (eCBSV) check.
    # Null for non-US verifications or when no SSA check ran.
    #
    # SSA `match` and `no_match` override the proprietary result in `kyc_check.id_number.summary`.
    # `is_deceased: true` sets that summary to `no_match`, regardless of the SSA match result.
    # If SSA returns `no_data` without a deceased result, the summary keeps the proprietary result.
    class KycCheckSsaAnalysis < Internal::Types::Model
      field :match, -> { Plaid::Types::KycCheckSsaMatchStatus }, optional: false, nullable: false

      field :is_deceased, -> { Internal::Types::Boolean }, optional: false, nullable: true

      field :name_match, -> { Plaid::Types::KycCheckSsaMatchStatus }, optional: true, nullable: false

      field :date_of_birth_match, -> { Plaid::Types::KycCheckSsaMatchStatus }, optional: true, nullable: false

      field :ssn_match, -> { Plaid::Types::KycCheckSsaMatchStatus }, optional: true, nullable: false

      field :other_match, -> { Plaid::Types::KycCheckSsaMatchStatus }, optional: true, nullable: false
    end
  end
end
