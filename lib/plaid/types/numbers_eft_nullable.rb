# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Identifying information for transferring money to or from a Canadian bank account via EFT.
    class NumbersEftNullable < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :account, -> { String }, optional: false, nullable: true

      field :institution, -> { String }, optional: false, nullable: false

      field :branch, -> { String }, optional: false, nullable: false
    end
  end
end
