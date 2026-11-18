# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Describes a consent event.
    class ConsentEvent < Internal::Types::Model
      field :item_id, -> { String }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false

      field :event_type, -> { Plaid::Types::ConsentEventType }, optional: true, nullable: false

      field :event_code, -> { Plaid::Types::ConsentEventCode }, optional: true, nullable: false

      field :institution_id, -> { String }, optional: true, nullable: true

      field :institution_name, -> { String }, optional: true, nullable: true

      field :initiator, -> { Plaid::Types::ConsentEventInitiator }, optional: true, nullable: false

      field :consented_use_cases, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :consented_data_scopes, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :consented_accounts, -> { Internal::Types::Array[Plaid::Types::ConsentedAccount] }, optional: true, nullable: false
    end
  end
end
