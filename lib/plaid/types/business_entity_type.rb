# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BusinessEntityType
      extend Plaid::Internal::Types::Enum

      SOLE_PROPRIETORSHIP = "sole_proprietorship"
      GENERAL_PARTNERSHIP = "general_partnership"
      LLC = "llc"
      LLP = "llp"
      LLLP = "lllp"
      LP = "lp"
      C_CORPORATION = "c_corporation"
      S_CORPORATION = "s_corporation"
      B_CORPORATION = "b_corporation"
      NONPROFIT = "nonprofit"
      COOPERATIVE = "cooperative"
      TRUST = "trust"
      PROFESSIONAL_ASSOCIATION = "professional_association"
      PROFESSIONAL_CORPORATION = "professional_corporation"
      TRADE_NAME = "trade_name"
      BANK = "bank"
      CREDIT_UNION = "credit_union"
      INSURANCE = "insurance"
      OTHER = "other"
      UNKNOWN = "unknown"
    end
  end
end
