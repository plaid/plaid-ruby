# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing an end user's 1099 tax form
    class Credit1099 < Internal::Types::Model
      field :document_id, -> { String }, optional: false, nullable: true

      field :document_metadata, -> { Plaid::Types::CreditDocumentMetadata }, optional: true, nullable: false

      field :form1099type, -> { Plaid::Types::Form1099Type }, optional: true, nullable: false, api_name: "form_1099_type"

      field :recipient, -> { Plaid::Types::Credit1099Recipient }, optional: true, nullable: false

      field :payer, -> { Plaid::Types::Credit1099Payer }, optional: true, nullable: false

      field :filer, -> { Plaid::Types::Credit1099Filer }, optional: true, nullable: false

      field :tax_year, -> { String }, optional: true, nullable: true

      field :rents, -> { Float }, optional: true, nullable: true

      field :royalties, -> { Float }, optional: true, nullable: true

      field :other_income, -> { Float }, optional: true, nullable: true

      field :federal_income_tax_withheld, -> { Float }, optional: true, nullable: true

      field :fishing_boat_proceeds, -> { Float }, optional: true, nullable: true

      field :medical_and_healthcare_payments, -> { Float }, optional: true, nullable: true

      field :nonemployee_compensation, -> { Float }, optional: true, nullable: true

      field :substitute_payments_in_lieu_of_dividends_or_interest, -> { Float }, optional: true, nullable: true

      field :payer_made_direct_sales_of5000or_more_of_consumer_products_to_buyer, -> { String }, optional: true, nullable: true, api_name: "payer_made_direct_sales_of_5000_or_more_of_consumer_products_to_buyer"

      field :crop_insurance_proceeds, -> { Float }, optional: true, nullable: true

      field :excess_golden_parachute_payments, -> { Float }, optional: true, nullable: true

      field :gross_proceeds_paid_to_an_attorney, -> { Float }, optional: true, nullable: true

      field :section409a_deferrals, -> { Float }, optional: true, nullable: true, api_name: "section_409a_deferrals"

      field :section409a_income, -> { Float }, optional: true, nullable: true, api_name: "section_409a_income"

      field :state_tax_withheld, -> { Float }, optional: true, nullable: true

      field :state_tax_withheld_lower, -> { Float }, optional: true, nullable: true

      field :payer_state_number, -> { String }, optional: true, nullable: true

      field :payer_state_number_lower, -> { String }, optional: true, nullable: true

      field :state_income, -> { Float }, optional: true, nullable: true

      field :state_income_lower, -> { Float }, optional: true, nullable: true

      field :transactions_reported, -> { String }, optional: true, nullable: true

      field :pse_name, -> { String }, optional: true, nullable: true

      field :pse_telephone_number, -> { String }, optional: true, nullable: true

      field :gross_amount, -> { Float }, optional: true, nullable: true

      field :card_not_present_transaction, -> { Float }, optional: true, nullable: true

      field :merchant_category_code, -> { String }, optional: true, nullable: true

      field :number_of_payment_transactions, -> { String }, optional: true, nullable: true

      field :january_amount, -> { Float }, optional: true, nullable: true

      field :february_amount, -> { Float }, optional: true, nullable: true

      field :march_amount, -> { Float }, optional: true, nullable: true

      field :april_amount, -> { Float }, optional: true, nullable: true

      field :may_amount, -> { Float }, optional: true, nullable: true

      field :june_amount, -> { Float }, optional: true, nullable: true

      field :july_amount, -> { Float }, optional: true, nullable: true

      field :august_amount, -> { Float }, optional: true, nullable: true

      field :september_amount, -> { Float }, optional: true, nullable: true

      field :october_amount, -> { Float }, optional: true, nullable: true

      field :november_amount, -> { Float }, optional: true, nullable: true

      field :december_amount, -> { Float }, optional: true, nullable: true

      field :primary_state, -> { String }, optional: true, nullable: true

      field :secondary_state, -> { String }, optional: true, nullable: true

      field :primary_state_id, -> { String }, optional: true, nullable: true

      field :secondary_state_id, -> { String }, optional: true, nullable: true

      field :primary_state_income_tax, -> { Float }, optional: true, nullable: true

      field :secondary_state_income_tax, -> { Float }, optional: true, nullable: true
    end
  end
end
