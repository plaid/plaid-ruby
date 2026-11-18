# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Describes the connected application for a particular end user.
    class ConnectedApplication < Internal::Types::Model
      field :application_id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :display_name, -> { String }, optional: true, nullable: true

      field :logo_url, -> { String }, optional: true, nullable: true

      field :application_url, -> { String }, optional: true, nullable: true

      field :reason_for_access, -> { String }, optional: true, nullable: true

      field :created_at, -> { String }, optional: false, nullable: false

      field :scopes, -> { Plaid::Types::ScopesNullable }, optional: true, nullable: true
    end
  end
end
