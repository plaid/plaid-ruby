# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Contains data for the CRA Home Lending Report.
    class CraVerificationReport < Internal::Types::Model
      field :report_id, -> { String }, optional: false, nullable: false

      field :gse_reference_id, -> { String }, optional: true, nullable: false

      field :client_report_id, -> { String }, optional: true, nullable: true

      field :voa, -> { Plaid::Types::CraVoaReport }, optional: true, nullable: true

      field :employment_refresh, -> { Plaid::Types::CraEmploymentRefreshReport }, optional: true, nullable: true

      field :income, -> { Plaid::Types::CraVerificationIncomeReport }, optional: true, nullable: true
    end
  end
end
