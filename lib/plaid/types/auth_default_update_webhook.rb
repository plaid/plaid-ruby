# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Plaid will trigger a `DEFAULT_UPDATE` webhook for Items that undergo a change in Auth data. This is generally
    # caused by data partners notifying Plaid of a change in their account numbering system or to their routing numbers.
    # To avoid returned transactions, customers that receive a `DEFAULT_UPDATE` webhook with the
    # `account_ids_with_updated_auth` object populated should immediately discontinue all usages of existing Auth data
    # for those accounts and call `/auth/get` or `/processor/auth/get` to obtain updated account and routing numbers.
    class AuthDefaultUpdateWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :account_ids_with_new_auth, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :account_ids_with_updated_auth, -> { Internal::Types::Hash[String, Internal::Types::Array[Plaid::Types::AuthUpdateTypes]] }, optional: false, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: false, nullable: true

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
