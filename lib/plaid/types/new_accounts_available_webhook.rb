# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when Plaid detects a new account. Upon receiving this webhook, you can prompt your users to share new
    # accounts with you through [update
    # mode](https://plaid.com/docs/link/update-mode/#using-update-mode-to-request-new-accounts) (US/CA only). If the end
    # user has opted not to share new accounts with Plaid via their institution's OAuth settings, Plaid will not detect
    # new accounts and this webhook will not fire. For end user accounts in the EU and UK, upon receiving this webhook,
    # you can prompt your user to re-link their account and then delete the old Item via `/item/remove`.
    class NewAccountsAvailableWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: true, nullable: false

      field :webhook_code, -> { String }, optional: true, nullable: false

      field :item_id, -> { String }, optional: true, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: true, nullable: true

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: true, nullable: false
    end
  end
end
