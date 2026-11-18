# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Displayed once a user has successfully linked their Item.
    class LinkSessionSuccessMetadata < Internal::Types::Model
      field :institution, -> { Plaid::Types::LinkSessionSuccessMetadataInstitution }, optional: true, nullable: true

      field :accounts, -> { Internal::Types::Array[Plaid::Types::LinkSessionSuccessMetadataAccount] }, optional: true, nullable: false

      field :link_session_id, -> { String }, optional: true, nullable: false

      field :session_group_id, -> { String }, optional: true, nullable: false

      field :transfer_status, -> { Plaid::Types::LinkSessionSuccessMetadataTransferStatus }, optional: true, nullable: true
    end
  end
end
