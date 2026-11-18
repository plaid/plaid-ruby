# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Results from the digital presence check.
    class BusinessDigitalPresenceCheck < Internal::Types::Model
      field :status, -> { Plaid::Types::BusinessVerificationStatusWebPresenceCheck }, optional: false, nullable: false

      field :score, -> { Integer }, optional: false, nullable: true

      field :address, -> { Plaid::Types::BusinessFieldMatchSummary }, optional: false, nullable: false

      field :phone_number, -> { Plaid::Types::BusinessFieldMatchSummary }, optional: false, nullable: false

      field :email_address, -> { Plaid::Types::BusinessFieldMatchSummary }, optional: false, nullable: false

      field :website, -> { Plaid::Types::BusinessFieldMatchSummary }, optional: false, nullable: false

      field :website_analysis, -> { Plaid::Types::BusinessWebsiteAnalysis }, optional: false, nullable: true
    end
  end
end
