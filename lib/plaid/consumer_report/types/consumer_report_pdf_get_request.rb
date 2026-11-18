# frozen_string_literal: true

module Plaid
  module ConsumerReport
    module Types
      class ConsumerReportPdfGetRequest < Internal::Types::Model
        field :user_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end
