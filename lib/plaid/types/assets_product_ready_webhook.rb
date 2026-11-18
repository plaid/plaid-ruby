# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when the Asset Report has been generated and `/asset_report/get` is ready to be called.  If you attempt to
    # retrieve an Asset Report before this webhook has fired, you'll receive a response with the HTTP status code 400
    # and a Plaid error code of `PRODUCT_NOT_READY`.
    class AssetsProductReadyWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :asset_report_id, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false

      field :report_type, -> { Plaid::Types::AssetReportType }, optional: true, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
