# frozen_string_literal: true

module Plaid
  module Partner
    module Types
      class BetaPartnerCustomerV1UpdateRequest < Internal::Types::Model
        field :end_customer_client_id, -> { String }, optional: false, nullable: false

        field :legal_entity_name, -> { String }, optional: true, nullable: false

        field :redirect_uris, -> { Internal::Types::Array[String] }, optional: true, nullable: false

        field :bank_addendum_acceptance, -> { Plaid::Types::PartnerEndCustomerBankAddendumAcceptance }, optional: true, nullable: false

        field :questionnaires, -> { Plaid::Types::PartnerEndCustomerQuestionnaires }, optional: true, nullable: false
      end
    end
  end
end
