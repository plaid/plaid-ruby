# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A Beacon User represents an end user that has been scanned against the Beacon Network.
    class BeaconUserUpdateResponse < Internal::Types::Model
      field :item_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :id, -> { String }, optional: false, nullable: false

      field :version, -> { Integer }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false

      field :updated_at, -> { String }, optional: false, nullable: false

      field :status, -> { Plaid::Types::BeaconUserStatus }, optional: false, nullable: false

      field :program_id, -> { String }, optional: false, nullable: false

      field :client_user_id, -> { String }, optional: false, nullable: false

      field :user, -> { Plaid::Types::BeaconUserData }, optional: false, nullable: false

      field :audit_trail, -> { Plaid::Types::BeaconAuditTrail }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
