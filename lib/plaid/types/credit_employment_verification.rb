# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The object containing proof of employment data for an individual.
    class CreditEmploymentVerification < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: true

      field :status, -> { String }, optional: false, nullable: true

      field :start_date, -> { String }, optional: false, nullable: true

      field :end_date, -> { String }, optional: false, nullable: true

      field :employer, -> { Plaid::Types::CreditEmployerVerification }, optional: false, nullable: false

      field :title, -> { String }, optional: false, nullable: true

      field :platform_ids, -> { Plaid::Types::CreditPlatformIDs }, optional: false, nullable: false

      field :employee_type, -> { String }, optional: false, nullable: true

      field :last_paystub_date, -> { String }, optional: false, nullable: true
    end
  end
end
