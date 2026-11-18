# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The details of an Item add in Link.
    class LinkSessionItemAddResult < Internal::Types::Model
      field :public_token, -> { String }, optional: false, nullable: false

      field :accounts, -> { Internal::Types::Array[Plaid::Types::LinkSessionSuccessMetadataAccount] }, optional: false, nullable: false

      field :institution, -> { Plaid::Types::LinkSessionSuccessMetadataInstitution }, optional: false, nullable: true
    end
  end
end
