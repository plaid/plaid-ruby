# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An account used to generate `cra_prism`.
    class CraReportGetPrismAccount < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :official_name, -> { String }, optional: false, nullable: true

      field :mask, -> { String }, optional: false, nullable: true

      field :type, -> { Plaid::Types::AccountType }, optional: false, nullable: false

      field :subtype, -> { Plaid::Types::AccountSubtype }, optional: false, nullable: true
    end
  end
end
