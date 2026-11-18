# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The details and metadata for an end user's Item within the Home Lending Income Report.
    class CraVerificationIncomeItem < Internal::Types::Model
      field :item_id, -> { String }, optional: false, nullable: false

      field :accounts, -> { Internal::Types::Array[Plaid::Types::CraVerificationIncomeAccount] }, optional: false, nullable: false

      field :last_updated_time, -> { String }, optional: false, nullable: false

      field :institution_id, -> { String }, optional: false, nullable: false

      field :institution_name, -> { String }, optional: false, nullable: false
    end
  end
end
