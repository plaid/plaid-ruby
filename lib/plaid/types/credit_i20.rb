# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing an end user's Form I-20 US immigration student document.
    class CreditI20 < Internal::Types::Model
      field :document_id, -> { String }, optional: true, nullable: true

      field :document_metadata, -> { Plaid::Types::CreditDocumentMetadata }, optional: true, nullable: false

      field :student, -> { Plaid::Types::CreditI20Student }, optional: true, nullable: false

      field :personal_funds, -> { Float }, optional: true, nullable: true

      field :on_campus_employment, -> { Float }, optional: true, nullable: true

      field :funds_from_this_school, -> { Float }, optional: true, nullable: true

      field :students_funding_total, -> { Float }, optional: true, nullable: true

      field :funds_from_another_source, -> { Float }, optional: true, nullable: true

      field :estimated_average_costs_total, -> { Float }, optional: true, nullable: true

      field :estimated_average_living_expenses, -> { Float }, optional: true, nullable: true

      field :students_funding_period_months, -> { Integer }, optional: true, nullable: true

      field :estimated_average_costs_period_months, -> { Integer }, optional: true, nullable: true
    end
  end
end
