# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # W2 is an object that represents income data taken from a W2 tax document.
    class W2Override < Internal::Types::Model
      field :employer, -> { Plaid::Types::PaystubOverrideEmployer }, optional: true, nullable: false

      field :employee, -> { Plaid::Types::PaystubOverrideEmployee }, optional: true, nullable: false

      field :tax_year, -> { Integer }, optional: true, nullable: true

      field :employer_id_number, -> { String }, optional: true, nullable: true

      field :wages_tips_other_comp, -> { Float }, optional: true, nullable: true

      field :federal_income_tax_withheld, -> { Float }, optional: true, nullable: true

      field :social_security_wages, -> { Float }, optional: true, nullable: true

      field :social_security_tax_withheld, -> { Float }, optional: true, nullable: true

      field :medicare_wages_and_tips, -> { Float }, optional: true, nullable: true

      field :medicare_tax_withheld, -> { Float }, optional: true, nullable: true

      field :social_security_tips, -> { Float }, optional: true, nullable: true

      field :allocated_tips, -> { Float }, optional: true, nullable: true

      field :box9, -> { String }, optional: true, nullable: true, api_name: "box_9"

      field :dependent_care_benefits, -> { Float }, optional: true, nullable: true

      field :nonqualified_plans, -> { Float }, optional: true, nullable: true

      field :box12, -> { Internal::Types::Array[Plaid::Types::W2Box12Override] }, optional: true, nullable: false, api_name: "box_12"

      field :statutory_employee, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :retirement_plan, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :third_party_sick_pay, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :other, -> { String }, optional: true, nullable: true

      field :state_and_local_wages, -> { Internal::Types::Array[Plaid::Types::W2StateAndLocalWagesOverride] }, optional: true, nullable: false
    end
  end
end
