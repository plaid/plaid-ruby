# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A collection of STATUS containers.
    class Statuses < Internal::Types::Model
      field :status, -> { Plaid::Types::Status }, optional: false, nullable: false, api_name: "STATUS"
    end
  end
end
