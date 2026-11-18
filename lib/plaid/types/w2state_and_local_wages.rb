# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # W2 state and local wages
    class W2StateAndLocalWages < Internal::Types::Model
      field :state, -> { String }, optional: true, nullable: true

      field :employer_state_id_number, -> { String }, optional: true, nullable: true

      field :state_wages_tips, -> { String }, optional: true, nullable: true

      field :state_income_tax, -> { String }, optional: true, nullable: true

      field :local_wages_tips, -> { String }, optional: true, nullable: true

      field :local_income_tax, -> { String }, optional: true, nullable: true

      field :locality_name, -> { String }, optional: true, nullable: true
    end
  end
end
