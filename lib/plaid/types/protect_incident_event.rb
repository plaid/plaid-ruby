# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details about the incident event.
    class ProtectIncidentEvent < Internal::Types::Model
      field :protect_event_id, -> { String }, optional: true, nullable: true

      field :link_session_id, -> { String }, optional: true, nullable: true

      field :idv_session_id, -> { String }, optional: true, nullable: true

      field :signal_client_transaction_id, -> { String }, optional: true, nullable: true

      field :internal_reference, -> { String }, optional: true, nullable: true

      field :time, -> { String }, optional: true, nullable: true

      field :amount, -> { Plaid::Types::ProtectIncidentAmount }, optional: true, nullable: true

      field :access_token, -> { String }, optional: true, nullable: true

      field :item_id, -> { String }, optional: true, nullable: true
    end
  end
end
