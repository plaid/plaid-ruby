# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An FDX consent grant.
    class FdxConsentGrant < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :status, -> { Plaid::Types::FdxConsentGrantStatus }, optional: false, nullable: false

      field :created_time, -> { String }, optional: false, nullable: false, api_name: "createdTime"

      field :updated_time, -> { String }, optional: false, nullable: false, api_name: "updatedTime"

      field :expiration_time, -> { String }, optional: true, nullable: false, api_name: "expirationTime"

      field :parties, -> { Internal::Types::Array[Plaid::Types::FdxParty] }, optional: false, nullable: false

      field :resources, -> { Internal::Types::Array[Plaid::Types::FdxConsentGrantResource] }, optional: true, nullable: false
    end
  end
end
