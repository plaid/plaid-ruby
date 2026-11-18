# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing a Base Report with Freddie Mac schema.
    class CraCheckReportFreddieMacVerificationOfAssetsDeal < Internal::Types::Model
      field :loans, -> { Plaid::Types::CreditFreddieMacLoans }, optional: false, nullable: false, api_name: "LOANS"

      field :parties, -> { Plaid::Types::CreditFreddieMacParties }, optional: false, nullable: false, api_name: "PARTIES"

      field :services, -> { Plaid::Types::CreditFreddieMacServices }, optional: false, nullable: false, api_name: "SERVICES"
    end
  end
end
