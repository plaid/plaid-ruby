# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Metadata and results for a Link session
    class CreditSession < Internal::Types::Model
      field :link_session_id, -> { String }, optional: true, nullable: false

      field :session_start_time, -> { String }, optional: true, nullable: false

      field :results, -> { Plaid::Types::CreditSessionResults }, optional: true, nullable: false

      field :errors, -> { Internal::Types::Array[Plaid::Types::CreditSessionError] }, optional: true, nullable: false
    end
  end
end
