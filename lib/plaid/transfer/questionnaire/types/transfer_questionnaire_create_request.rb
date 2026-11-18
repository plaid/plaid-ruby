# frozen_string_literal: true

module Plaid
  module Transfer
    module Questionnaire
      module Types
        class TransferQuestionnaireCreateRequest < Internal::Types::Model
          field :originator_client_id, -> { String }, optional: false, nullable: false

          field :redirect_uri, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
