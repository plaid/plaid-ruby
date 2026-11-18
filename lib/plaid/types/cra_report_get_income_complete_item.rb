# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An Item used to generate `cra_income_complete`, with each account's owners, identity match scores, primary account
    # prediction, and the consumer's dispute statements.
    class CraReportGetIncomeCompleteItem < Internal::Types::Model
      field :institution_id, -> { String }, optional: false, nullable: false

      field :institution_name, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :last_updated_time, -> { String }, optional: false, nullable: false

      field :accounts, -> { Internal::Types::Array[Plaid::Types::CraReportGetIncomeCompleteAccount] }, optional: false, nullable: false
    end
  end
end
