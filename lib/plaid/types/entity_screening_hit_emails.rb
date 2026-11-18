# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Email address information for the associated entity watchlist hit
    class EntityScreeningHitEmails < Internal::Types::Model
      field :email_address, -> { String }, optional: false, nullable: false
    end
  end
end
