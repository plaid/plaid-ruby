# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing an email address
    class Email < Internal::Types::Model
      field :data, -> { String }, optional: false, nullable: false

      field :primary, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :type, -> { Plaid::Types::EmailType }, optional: false, nullable: false
    end
  end
end
