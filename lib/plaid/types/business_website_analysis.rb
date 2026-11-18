# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Website analysis details if a website is found for the provided website in the search terms.
    class BusinessWebsiteAnalysis < Internal::Types::Model
      field :is_parked, -> { Plaid::Types::BusinessCheckBooleanStatus }, optional: false, nullable: false

      field :email_is_deliverable, -> { Plaid::Types::BusinessCheckBooleanStatus }, optional: false, nullable: false

      field :website_build_status, -> { Plaid::Types::BusinessWebsiteBuildStatus }, optional: false, nullable: true

      field :whois_record, -> { Plaid::Types::BusinessWhoisRecord }, optional: false, nullable: false

      field :ssl, -> { Plaid::Types::BusinessWebsiteSsl }, optional: false, nullable: false
    end
  end
end
