# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The user's legal name
    class SignalPersonName < Internal::Types::Model
      field :prefix, -> { String }, optional: true, nullable: true

      field :given_name, -> { String }, optional: true, nullable: true

      field :middle_name, -> { String }, optional: true, nullable: true

      field :family_name, -> { String }, optional: true, nullable: true

      field :suffix, -> { String }, optional: true, nullable: true
    end
  end
end
