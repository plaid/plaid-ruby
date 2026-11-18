# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Result summary object specifying values for `email` attributes of risk check.
    class RiskCheckEmail < Internal::Types::Model
      field :is_deliverable, -> { Plaid::Types::RiskCheckEmailIsDeliverableStatus }, optional: false, nullable: false

      field :breach_count, -> { Integer }, optional: false, nullable: true

      field :first_breached_at, -> { String }, optional: false, nullable: true

      field :last_breached_at, -> { String }, optional: false, nullable: true

      field :domain_registered_at, -> { String }, optional: false, nullable: true

      field :domain_is_free_provider, -> { Plaid::Types::RiskCheckEmailDomainIsFreeProvider }, optional: false, nullable: false

      field :domain_is_custom, -> { Plaid::Types::RiskCheckEmailDomainIsCustom }, optional: false, nullable: false

      field :domain_is_disposable, -> { Plaid::Types::RiskCheckEmailDomainIsDisposable }, optional: false, nullable: false

      field :top_level_domain_is_suspicious, -> { Plaid::Types::RiskCheckEmailTopLevelDomainIsSuspicious }, optional: false, nullable: false

      field :is_edu, -> { Plaid::Types::RiskCheckEmailIsEdu }, optional: false, nullable: false

      field :includes_date_of_birth, -> { Plaid::Types::RiskCheckEmailIncludesDateOfBirth }, optional: false, nullable: false

      field :name, -> { Plaid::Types::RiskCheckEmailName }, optional: false, nullable: false

      field :linked_services, -> { Internal::Types::Array[Plaid::Types::RiskCheckLinkedService] }, optional: false, nullable: false

      field :risk_level, -> { Plaid::Types::RiskLevel }, optional: true, nullable: false

      field :factors, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
