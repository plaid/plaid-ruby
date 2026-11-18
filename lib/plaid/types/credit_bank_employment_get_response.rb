# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CreditBankEmploymentGetResponse defines the response schema for `/beta/credit/v1/bank_employment/get`.
    class CreditBankEmploymentGetResponse < Internal::Types::Model
      field :bank_employment_reports, -> { Internal::Types::Array[Plaid::Types::CreditBankEmploymentReport] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
