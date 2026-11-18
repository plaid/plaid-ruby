# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object containing metadata about the extracted account.
    class CraBankIncomeAccountMetadata < Internal::Types::Model
      field :start_date, -> { String }, optional: false, nullable: true

      field :end_date, -> { String }, optional: false, nullable: true
    end
  end
end
