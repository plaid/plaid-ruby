# frozen_string_literal: true

module Plaid
  module CashAdvance
    module Types
      class BetaCashAdvanceIncomeInsightsV1GetRequest < Internal::Types::Model
        field :user_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
