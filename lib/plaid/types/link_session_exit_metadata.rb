# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Displayed if a user exits Link without successfully linking an Item.
    class LinkSessionExitMetadata < Internal::Types::Model
      field :institution, -> { Plaid::Types::LinkSessionExitMetadataInstitution }, optional: true, nullable: true

      field :status, -> { String }, optional: true, nullable: false

      field :link_session_id, -> { String }, optional: true, nullable: false

      field :request_id, -> { String }, optional: true, nullable: false
    end
  end
end
