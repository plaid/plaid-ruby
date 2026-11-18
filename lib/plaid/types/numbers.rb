# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Account and bank identifier number data used to configure the test account. All values are optional.
    class Numbers < Internal::Types::Model
      field :account, -> { String }, optional: true, nullable: false

      field :ach_routing, -> { String }, optional: true, nullable: false

      field :ach_wire_routing, -> { String }, optional: true, nullable: false

      field :eft_institution, -> { String }, optional: true, nullable: false

      field :eft_branch, -> { String }, optional: true, nullable: false

      field :international_bic, -> { String }, optional: true, nullable: false

      field :international_iban, -> { String }, optional: true, nullable: false

      field :bacs_sort_code, -> { String }, optional: true, nullable: false

      field :acats_dtc_number, -> { String }, optional: true, nullable: false
    end
  end
end
