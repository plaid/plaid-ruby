# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An Item created during a Layer authorization session.
    class UserAccountItem < Internal::Types::Model
      field :item_id, -> { String }, optional: true, nullable: false

      field :access_token, -> { String }, optional: true, nullable: false
    end
  end
end
