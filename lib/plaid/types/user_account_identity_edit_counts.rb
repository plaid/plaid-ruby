# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Edit counts over various time periods.
    class UserAccountIdentityEditCounts < Internal::Types::Model
      field :edits_current, -> { Integer }, optional: true, nullable: false

      field :edits1d, -> { Integer }, optional: true, nullable: false, api_name: "edits_1d"

      field :edits30d, -> { Integer }, optional: true, nullable: false, api_name: "edits_30d"

      field :edits365d, -> { Integer }, optional: true, nullable: false, api_name: "edits_365d"

      field :edits_all_time, -> { Integer }, optional: true, nullable: false
    end
  end
end
