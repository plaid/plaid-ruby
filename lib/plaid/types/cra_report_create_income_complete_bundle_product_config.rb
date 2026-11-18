# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Requests the given version of the Income Complete product bundle, optionally configuring how it is generated.
    # Income Complete bundles Income Insights with the Items and accounts used to generate it, which are returned only
    # when the report's `scope` is `CLIENT_USER`.
    class CraReportCreateIncomeCompleteBundleProductConfig < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false

      field :options, -> { Plaid::Types::CraReportCreateIncomeCompleteOptions }, optional: true, nullable: true
    end
  end
end
