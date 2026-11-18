# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specifies user stated income sources for the Income product
    class LinkTokenCreateRequestUserStatedIncomeSource < Internal::Types::Model
      field :employer, -> { String }, optional: true, nullable: false

      field :category, -> { Plaid::Types::UserStatedIncomeSourceCategory }, optional: true, nullable: false

      field :pay_per_cycle, -> { Float }, optional: true, nullable: false

      field :pay_annual, -> { Float }, optional: true, nullable: false

      field :pay_type, -> { Plaid::Types::UserStatedIncomeSourcePayType }, optional: true, nullable: false

      field :pay_frequency, -> { Plaid::Types::UserStatedIncomeSourceFrequency }, optional: true, nullable: false
    end
  end
end
