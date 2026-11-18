# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Represents an end user for `/protect/compute` requests.
    class ProtectUser < Internal::Types::Model
      field :user_id, -> { String }, optional: true, nullable: false

      field :client_user_id, -> { String }, optional: true, nullable: false
    end
  end
end
