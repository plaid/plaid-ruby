# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A collection of objects that describe requests and responses for services.
    class Services < Internal::Types::Model
      field :service, -> { Plaid::Types::Service }, optional: false, nullable: false, api_name: "SERVICE"
    end
  end
end
