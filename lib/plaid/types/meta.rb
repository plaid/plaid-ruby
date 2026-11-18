# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Allows specifying the metadata of the test account
    class Meta < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false

      field :official_name, -> { String }, optional: true, nullable: false

      field :limit, -> { Float }, optional: true, nullable: false

      field :mask, -> { String }, optional: true, nullable: false

      field :apy, -> { Float }, optional: true, nullable: false
    end
  end
end
