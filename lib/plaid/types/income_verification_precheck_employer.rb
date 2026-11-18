# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information about the end user's employer
    class IncomeVerificationPrecheckEmployer < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: true

      field :address, -> { Plaid::Types::IncomeVerificationPrecheckEmployerAddress }, optional: true, nullable: true

      field :tax_id, -> { String }, optional: true, nullable: true

      field :url, -> { String }, optional: true, nullable: true
    end
  end
end
