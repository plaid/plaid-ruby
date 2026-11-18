# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A financial institution account.
    class ConsentedAccount < Internal::Types::Model
      field :account_id, -> { String }, optional: true, nullable: false

      field :mask, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :official_name, -> { String }, optional: true, nullable: false

      field :type, -> { Plaid::Types::AccountType }, optional: true, nullable: false

      field :subtype, -> { Plaid::Types::AccountSubtype }, optional: true, nullable: true
    end
  end
end
