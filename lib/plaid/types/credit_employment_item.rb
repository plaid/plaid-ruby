# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The object containing employment items.
    class CreditEmploymentItem < Internal::Types::Model
      field :item_id, -> { String }, optional: false, nullable: false

      field :employments, -> { Internal::Types::Array[Plaid::Types::CreditEmploymentVerification] }, optional: false, nullable: false

      field :employment_report_token, -> { String }, optional: true, nullable: false
    end
  end
end
