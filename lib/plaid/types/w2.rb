# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # W2 is an object that represents income data taken from a W2 tax document.
    class W2 < Internal::Types::Model
      field :employer, -> { Plaid::Types::PaystubEmployer }, optional: true, nullable: false

      field :employee, -> { Plaid::Types::Employee }, optional: true, nullable: false

      field :tax_year, -> { String }, optional: true, nullable: true

      field :employer_id_number, -> { String }, optional: true, nullable: true

      field :wages_tips_other_comp, -> { String }, optional: true, nullable: true

      field :federal_income_tax_withheld, -> { String }, optional: true, nullable: true

      field :social_security_wages, -> { String }, optional: true, nullable: true

      field :social_security_tax_withheld, -> { String }, optional: true, nullable: true

      field :medicare_wages_and_tips, -> { String }, optional: true, nullable: true

      field :medicare_tax_withheld, -> { String }, optional: true, nullable: true

      field :social_security_tips, -> { String }, optional: true, nullable: true

      field :allocated_tips, -> { String }, optional: true, nullable: true

      field :box9, -> { String }, optional: true, nullable: true, api_name: "box_9"

      field :dependent_care_benefits, -> { String }, optional: true, nullable: true

      field :nonqualified_plans, -> { String }, optional: true, nullable: true

      field :box12, -> { Internal::Types::Array[Plaid::Types::W2Box12] }, optional: true, nullable: false, api_name: "box_12"

      field :statutory_employee, -> { String }, optional: true, nullable: true

      field :retirement_plan, -> { String }, optional: true, nullable: true

      field :third_party_sick_pay, -> { String }, optional: true, nullable: true

      field :other, -> { String }, optional: true, nullable: true

      field :state_and_local_wages, -> { Internal::Types::Array[Plaid::Types::W2StateAndLocalWages] }, optional: true, nullable: false
    end
  end
end
