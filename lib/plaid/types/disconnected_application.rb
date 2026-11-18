# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Describes an application that a particular end user previously connected and has since disconnected.
    class DisconnectedApplication < Internal::Types::Model
      field :application_id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :display_name, -> { String }, optional: true, nullable: true

      field :logo_url, -> { String }, optional: true, nullable: true

      field :application_url, -> { String }, optional: true, nullable: true

      field :reason_for_access, -> { String }, optional: true, nullable: true
    end
  end
end
