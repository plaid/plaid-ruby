# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when an `ACCESS_NOT_GRANTED` error is hit for Identity. The error can be resolved by putting the user
    # through update mode with `identity` in the `products` array, as well as through the limited beta for update mode
    # Identity product validations.
    class ProductPermissionsRequiredIdentityWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
