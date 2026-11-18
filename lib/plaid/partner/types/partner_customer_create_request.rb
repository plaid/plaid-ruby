# frozen_string_literal: true

module Plaid
  module Partner
    module Types
      class PartnerCustomerCreateRequest < Internal::Types::Model
        field :company_name, -> { String }, optional: false, nullable: false

        field :is_diligence_attested, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :products, -> { Internal::Types::Array[Plaid::Types::Products] }, optional: true, nullable: false

        field :create_link_customization, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :logo, -> { String }, optional: true, nullable: false

        field :legal_entity_name, -> { String }, optional: false, nullable: false

        field :website, -> { String }, optional: false, nullable: false

        field :application_name, -> { String }, optional: false, nullable: false

        field :technical_contact, -> { Plaid::Types::PartnerEndCustomerTechnicalContact }, optional: true, nullable: false

        field :billing_contact, -> { Plaid::Types::PartnerEndCustomerBillingContact }, optional: true, nullable: false

        field :customer_support_info, -> { Plaid::Types::PartnerEndCustomerCustomerSupportInfo }, optional: true, nullable: false

        field :address, -> { Plaid::Types::PartnerEndCustomerAddress }, optional: false, nullable: false

        field :is_bank_addendum_completed, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :assets_under_management, -> { Plaid::Types::PartnerEndCustomerAssetsUnderManagement }, optional: true, nullable: false

        field :redirect_uris, -> { Internal::Types::Array[String] }, optional: true, nullable: false

        field :registration_number, -> { String }, optional: true, nullable: false
      end
    end
  end
end
