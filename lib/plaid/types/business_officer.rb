# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An officer of the business.
    class BusinessOfficer < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
    end
  end
end
