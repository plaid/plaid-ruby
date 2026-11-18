# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object containing proof of employment data for an individual
    class EmploymentVerification < Internal::Types::Model
      field :status, -> { Plaid::Types::EmploymentVerificationStatus }, optional: true, nullable: true

      field :start_date, -> { String }, optional: true, nullable: true

      field :end_date, -> { String }, optional: true, nullable: true

      field :employer, -> { Plaid::Types::EmployerVerification }, optional: true, nullable: false

      field :title, -> { String }, optional: true, nullable: true

      field :platform_ids, -> { Plaid::Types::PlatformIDs }, optional: true, nullable: false
    end
  end
end
