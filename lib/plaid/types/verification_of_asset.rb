# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Documentation not found in the MISMO model viewer and not provided by Freddie Mac.
    class VerificationOfAsset < Internal::Types::Model
      field :reporting_information, -> { Plaid::Types::ReportingInformation }, optional: false, nullable: false, api_name: "REPORTING_INFORMATION"

      field :service_product_fulfillment, -> { Plaid::Types::ServiceProductFulfillment }, optional: false, nullable: false, api_name: "SERVICE_PRODUCT_FULFILLMENT"

      field :verification_of_asset_response, -> { Plaid::Types::VerificationOfAssetResponse }, optional: false, nullable: false, api_name: "VERIFICATION_OF_ASSET_RESPONSE"
    end
  end
end
