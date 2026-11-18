# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when generation finishes for a Consumer Report requested via `/cra/report/create` or a Link session
    # configured with `cra_report_parameter`, whether every requested product was generated, only some were, or none
    # were. `successful_products` and `failed_products` indicate which products were generated, and `error_code` is
    # populated when every product failed. Call `/cra/report/get` for the generated products and for error details on
    # failed products.
    class CraReportReadyWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: false, nullable: false

      field :client_user_id, -> { String }, optional: false, nullable: true

      field :report_id, -> { String }, optional: false, nullable: true

      field :client_report_id, -> { String }, optional: false, nullable: true

      field :scope, -> { Plaid::Types::CraReportScope }, optional: false, nullable: false

      field :successful_products, -> { Internal::Types::Array[Plaid::Types::CreditProduct] }, optional: false, nullable: false

      field :failed_products, -> { Internal::Types::Array[Plaid::Types::CreditProduct] }, optional: false, nullable: false

      field :generated_time, -> { String }, optional: false, nullable: true

      field :error_code, -> { Plaid::Types::CraReportErrorCode }, optional: false, nullable: true

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
