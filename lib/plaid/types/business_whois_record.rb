# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # WHOIS metadata for the business website domain.
    class BusinessWhoisRecord < Internal::Types::Model
      field :domain_created_at, -> { String }, optional: false, nullable: true

      field :domain_updated_at, -> { String }, optional: false, nullable: true

      field :domain_expires_at, -> { String }, optional: false, nullable: true

      field :registrar, -> { String }, optional: false, nullable: true
    end
  end
end
