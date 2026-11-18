# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object containing information about a link session. Session data will be provided for up to six hours after the
    # session has ended.
    class LinkTokenGetSessionsResponse < Internal::Types::Model
      field :link_session_id, -> { String }, optional: false, nullable: false

      field :started_at, -> { String }, optional: true, nullable: false

      field :finished_at, -> { String }, optional: true, nullable: true

      field :on_success, -> { Plaid::Types::LinkSessionSuccess }, optional: true, nullable: true

      field :on_exit, -> { Plaid::Types::LinkSessionExitDeprecated }, optional: true, nullable: true

      field :exit, -> { Plaid::Types::LinkSessionExit }, optional: true, nullable: true

      field :events, -> { Internal::Types::Array[Plaid::Types::LinkEvent] }, optional: true, nullable: false

      field :results, -> { Plaid::Types::LinkSessionResults }, optional: true, nullable: true
    end
  end
end
