# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CraPdfAddOns
      extend Plaid::Internal::Types::Enum

      CRA_INCOME_INSIGHTS = "cra_income_insights"
      CRA_PARTNER_INSIGHTS = "cra_partner_insights"
      CRA_LEND_SCORE = "cra_lend_score"
    end
  end
end
