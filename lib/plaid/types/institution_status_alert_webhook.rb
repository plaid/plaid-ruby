# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when institution status meets the conditions configured in the developer dashboard.
    class InstitutionStatusAlertWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :institution_id, -> { String }, optional: false, nullable: false

      field :institution_overall_success_rate, -> { Float }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
