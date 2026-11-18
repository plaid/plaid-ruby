# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # W2 is an object that represents income data taken from a W2 tax document.
    class CreditW2 < Internal::Types::Model
      field :document_metadata, -> { Plaid::Types::CreditDocumentMetadata }, optional: false, nullable: false

      field :document_id, -> { String }, optional: false, nullable: false

      field :employer, -> { Plaid::Types::CreditPayStubEmployer }, optional: false, nullable: false

      field :employee, -> { Plaid::Types::CreditPayStubEmployee }, optional: false, nullable: false

      field :tax_year, -> { String }, optional: false, nullable: true

      field :employer_id_number, -> { String }, optional: false, nullable: true

      field :wages_tips_other_comp, -> { String }, optional: false, nullable: true

      field :federal_income_tax_withheld, -> { String }, optional: false, nullable: true

      field :social_security_wages, -> { String }, optional: false, nullable: true

      field :social_security_tax_withheld, -> { String }, optional: false, nullable: true

      field :medicare_wages_and_tips, -> { String }, optional: false, nullable: true

      field :medicare_tax_withheld, -> { String }, optional: false, nullable: true

      field :social_security_tips, -> { String }, optional: false, nullable: true

      field :allocated_tips, -> { String }, optional: false, nullable: true

      field :box9, -> { String }, optional: false, nullable: true, api_name: "box_9"

      field :dependent_care_benefits, -> { String }, optional: false, nullable: true

      field :nonqualified_plans, -> { String }, optional: false, nullable: true

      field :box12, -> { Internal::Types::Array[Plaid::Types::W2Box12] }, optional: false, nullable: false, api_name: "box_12"

      field :statutory_employee, -> { String }, optional: false, nullable: true

      field :retirement_plan, -> { String }, optional: false, nullable: true

      field :third_party_sick_pay, -> { String }, optional: false, nullable: true

      field :other, -> { String }, optional: false, nullable: true

      field :state_and_local_wages, -> { Internal::Types::Array[Plaid::Types::W2StateAndLocalWages] }, optional: false, nullable: false
    end
  end
end
