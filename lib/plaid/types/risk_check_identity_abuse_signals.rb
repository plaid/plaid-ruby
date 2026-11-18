# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Result summary object capturing abuse signals related to `identity abuse`, e.g. stolen and synthetic identity
    # fraud. These attributes are only available for US identities and some signals may not be available depending on
    # what information was collected.
    class RiskCheckIdentityAbuseSignals < Internal::Types::Model
      field :synthetic_identity, -> { Plaid::Types::RiskCheckSyntheticIdentity }, optional: false, nullable: true

      field :stolen_identity, -> { Plaid::Types::RiskCheckStolenIdentity }, optional: false, nullable: true
    end
  end
end
