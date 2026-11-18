# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Identifying information for transferring holdings to an investment account via ACATS.
    class NumbersAcats < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :account, -> { String }, optional: false, nullable: false

      field :dtc_numbers, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
