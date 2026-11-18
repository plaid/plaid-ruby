# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The webhook of type `PARTNER` and code `END_CUSTOMER_OAUTH_STATUS_UPDATED` will be fired when a partner's end
    # customer has an update on their OAuth registration status with an institution.
    class PartnerEndCustomerOAuthStatusUpdatedWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :end_customer_client_id, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false

      field :institution_id, -> { String }, optional: false, nullable: false

      field :institution_name, -> { String }, optional: false, nullable: false

      field :status, -> { Plaid::Types::PartnerEndCustomerOAuthStatusUpdatedValues }, optional: false, nullable: false
    end
  end
end
