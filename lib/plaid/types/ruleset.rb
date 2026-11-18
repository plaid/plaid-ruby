# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details about the transaction result after evaluation by the requested Ruleset. If a `ruleset_key` is not
    # provided, for customers who began using Signal Transaction Scores before October 15, 2025, by default, this field
    # will be omitted. To learn more, see [Signal Rules](https://plaid.com/docs/signal/signal-rules/).
    class Ruleset < Internal::Types::Model
      field :ruleset_key, -> { String }, optional: true, nullable: false

      field :result, -> { Plaid::Types::RuleResult }, optional: false, nullable: false

      field :triggered_rule_details, -> { Plaid::Types::RuleDetails }, optional: true, nullable: true

      field :outcome, -> { String }, optional: true, nullable: false
    end
  end
end
