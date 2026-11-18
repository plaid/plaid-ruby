# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Identifying information for transferring holdings from a 401k account to another 401k account or IRA via the
    # manual 401k rollover process.
    class NumbersRetirement401K < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :plan, -> { String }, optional: true, nullable: false

      field :account, -> { String }, optional: true, nullable: false
    end
  end
end
