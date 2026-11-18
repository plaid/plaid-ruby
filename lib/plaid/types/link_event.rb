# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An event that occurred while the user was going through Link
    class LinkEvent < Internal::Types::Model
      field :event_name, -> { String }, optional: false, nullable: false

      field :timestamp, -> { String }, optional: false, nullable: false

      field :event_id, -> { String }, optional: false, nullable: false

      field :event_metadata, -> { Plaid::Types::LinkEventMetadata }, optional: false, nullable: false
    end
  end
end
