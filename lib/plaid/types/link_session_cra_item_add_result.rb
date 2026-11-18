# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The details of a Plaid Check Item add in Link.
    class LinkSessionCraItemAddResult < Internal::Types::Model
      field :item_id, -> { String }, optional: false, nullable: false

      field :accounts, -> { Internal::Types::Array[Plaid::Types::LinkSessionSuccessMetadataAccount] }, optional: false, nullable: false

      field :institution, -> { Plaid::Types::LinkSessionSuccessMetadataInstitution }, optional: false, nullable: true
    end
  end
end
