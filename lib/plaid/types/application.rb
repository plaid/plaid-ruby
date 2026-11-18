# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Metadata about the application
    class Application < Internal::Types::Model
      field :application_id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :display_name, -> { String }, optional: false, nullable: true

      field :join_date, -> { String }, optional: false, nullable: false

      field :logo_url, -> { String }, optional: false, nullable: true

      field :application_url, -> { String }, optional: false, nullable: true

      field :reason_for_access, -> { String }, optional: false, nullable: true

      field :use_case, -> { String }, optional: false, nullable: true

      field :company_legal_name, -> { String }, optional: false, nullable: true

      field :city, -> { String }, optional: false, nullable: true

      field :region, -> { String }, optional: false, nullable: true

      field :postal_code, -> { String }, optional: false, nullable: true

      field :country_code, -> { String }, optional: false, nullable: true
    end
  end
end
