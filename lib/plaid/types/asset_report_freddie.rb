# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing an Asset Report with Freddie Mac schema.
    class AssetReportFreddie < Internal::Types::Model
      field :loans, -> { Plaid::Types::Loans }, optional: false, nullable: false, api_name: "LOANS"

      field :parties, -> { Plaid::Types::Parties }, optional: false, nullable: false, api_name: "PARTIES"

      field :services, -> { Plaid::Types::Services }, optional: false, nullable: false, api_name: "SERVICES"
    end
  end
end
