# frozen_string_literal: true

module Plaid
  module Credit
    module Types
      class CreditPayrollIncomeParsingConfigUpdateRequest < Internal::Types::Model
        field :user_token, -> { String }, optional: true, nullable: false

        field :user_id, -> { String }, optional: true, nullable: false

        field :item_id, -> { String }, optional: true, nullable: false

        field :parsing_config, -> { Internal::Types::Array[Plaid::Types::IncomeVerificationDocParsingConfig] }, optional: false, nullable: false
      end
    end
  end
end
