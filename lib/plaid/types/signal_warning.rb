# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Conveys information about the errors causing missing or stale bank data used to construct the `/signal/evaluate`
    # scores and response
    class SignalWarning < Internal::Types::Model
      field :warning_type, -> { String }, optional: true, nullable: false

      field :warning_code, -> { String }, optional: true, nullable: false

      field :warning_message, -> { String }, optional: true, nullable: false
    end
  end
end
