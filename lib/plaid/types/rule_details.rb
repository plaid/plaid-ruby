# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Rules are run in numerical order. The first rule with a logic match is triggered. These are the details of that
    # rule.
    class RuleDetails < Internal::Types::Model
      field :internal_note, -> { String }, optional: true, nullable: false

      field :custom_action_key, -> { String }, optional: true, nullable: false
    end
  end
end
