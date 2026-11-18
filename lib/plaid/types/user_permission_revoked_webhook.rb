# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The `USER_PERMISSION_REVOKED` webhook may be fired when an end user has revoked the permission that they
    # previously granted to access an Item. If the end user revoked their permissions through Plaid (such as via the
    # Plaid Portal or by contacting Plaid support), the webhook will fire. If the end user revoked their permissions
    # directly through the institution, this webhook may not always fire, since some institutions' consent portals do
    # not trigger this webhook. To attempt to restore the Item, it can be sent through [update
    # mode](https://plaid.com/docs/link/update-mode). Depending on the exact process the end user used to revoke
    # permissions, it may not be possible to launch update mode for the Item. If you encounter an error when attempting
    # to create a Link token for update mode on an Item with revoked permissions, create a fresh Link token for the
    # user.
    #
    # Note that when working with tokenized account numbers with Auth or Transfer, the account number provided by Plaid
    # will no longer work for creating transfers once user permission has been revoked, except for US Bank Items.
    class UserPermissionRevokedWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: true, nullable: true

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
