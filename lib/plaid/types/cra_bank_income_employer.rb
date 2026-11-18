# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The object containing employer data.
    class CraBankIncomeEmployer < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: true
    end
  end
end
