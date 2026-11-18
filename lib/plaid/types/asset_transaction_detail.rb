# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Documentation not found in the MISMO model viewer and not provided by Freddie Mac.
    class AssetTransactionDetail < Internal::Types::Model
      field :asset_transaction_unique_identifier, -> { String }, optional: false, nullable: false, api_name: "AssetTransactionUniqueIdentifier"

      field :asset_transaction_amount, -> { Float }, optional: false, nullable: false, api_name: "AssetTransactionAmount"

      field :asset_transaction_date, -> { String }, optional: false, nullable: false, api_name: "AssetTransactionDate"

      field :asset_transaction_post_date, -> { String }, optional: false, nullable: false, api_name: "AssetTransactionPostDate"

      field :asset_transaction_type, -> { Plaid::Types::AssetTransactionType }, optional: false, nullable: false, api_name: "AssetTransactionType"

      field :asset_investment_transaction_type, -> { Plaid::Types::AssetInvestmentTransactionType }, optional: true, nullable: true, api_name: "AssetInvestmentTransactionType"

      field :asset_transaction_paid_by_name, -> { String }, optional: false, nullable: true, api_name: "AssetTransactionPaidByName"

      field :asset_transaction_paid_to_name, -> { String }, optional: true, nullable: true, api_name: "AssetTransactionPaidToName"

      field :asset_transaction_type_additional_description, -> { String }, optional: false, nullable: true, api_name: "AssetTransactionTypeAdditionalDescription"

      field :asset_investment_transaction_type_description, -> { String }, optional: false, nullable: true, api_name: "AssetInvestmentTransactionTypeDescription"

      field :asset_transaction_category_type, -> { Plaid::Types::AssetTransactionCategoryType }, optional: false, nullable: true, api_name: "AssetTransactionCategoryType"

      field :financial_institution_transaction_identifier, -> { String }, optional: false, nullable: true, api_name: "FinancialInstitutionTransactionIdentifier"
    end
  end
end
