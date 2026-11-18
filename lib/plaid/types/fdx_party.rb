# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # FDX Participant - an entity or person that is a part of a FDX API transaction
    class FdxParty < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :type, -> { Plaid::Types::FdxPartyType }, optional: false, nullable: false

      field :home_uri, -> { String }, optional: true, nullable: false, api_name: "homeUri"

      field :logo_uri, -> { String }, optional: true, nullable: false, api_name: "logoUri"

      field :registry, -> { Plaid::Types::FdxPartyRegistry }, optional: true, nullable: false

      field :registered_entity_name, -> { String }, optional: true, nullable: false, api_name: "registeredEntityName"

      field :registered_entity_id, -> { String }, optional: true, nullable: false, api_name: "registeredEntityId"
    end
  end
end
