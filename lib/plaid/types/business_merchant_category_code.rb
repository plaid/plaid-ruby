# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A related Merchant Category Code (MCC) and its description.
    class BusinessMerchantCategoryCode < Internal::Types::Model
      field :code, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: true
    end
  end
end
