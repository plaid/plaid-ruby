# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The webhook of type `LIABILITIES` and code `DEFAULT_UPDATE` will be fired when new or updated liabilities have
    # been detected on a liabilities item.
    class LiabilitiesDefaultUpdateWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: false, nullable: true

      field :account_ids_with_new_liabilities, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :account_ids_with_updated_liabilities, -> { Internal::Types::Hash[String, Internal::Types::Array[String]] }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
