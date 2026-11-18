# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A Beacon User Revision identifies a Beacon User at some point in its revision history.
    class BeaconUserRevision < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :version, -> { Integer }, optional: false, nullable: false
    end
  end
end
