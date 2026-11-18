# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Response schema for `/partner/customer/oauth_institutions/get`.
    class PartnerCustomerOAuthInstitutionsGetResponse < Internal::Types::Model
      field :flowdown_status, -> { Plaid::Types::PartnerEndCustomerFlowdownStatus }, optional: true, nullable: false

      field :questionnaire_status, -> { Plaid::Types::PartnerEndCustomerQuestionnaireStatus }, optional: true, nullable: false

      field :institutions, -> { Internal::Types::Array[Plaid::Types::PartnerEndCustomerOAuthInstitution] }, optional: true, nullable: false

      field :request_id, -> { String }, optional: true, nullable: false
    end
  end
end
