# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A checking, savings, or money market account used to generate `cra_ultrafico`, with its owners, identity match
    # scores, and primary account prediction.
    class CraReportGetUltraFicoAccount < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :official_name, -> { String }, optional: false, nullable: true

      field :mask, -> { String }, optional: false, nullable: true

      field :type, -> { Plaid::Types::AccountType }, optional: false, nullable: false

      field :subtype, -> { Plaid::Types::AccountSubtype }, optional: false, nullable: true

      field :primary_account, -> { Plaid::Types::CraReportGetAccountPrimaryAccount }, optional: false, nullable: true

      field :identity_match, -> { Plaid::Types::CraReportGetAccountIdentityMatch }, optional: false, nullable: true

      field :owners, -> { Internal::Types::Array[Plaid::Types::Owner] }, optional: false, nullable: false
    end
  end
end
