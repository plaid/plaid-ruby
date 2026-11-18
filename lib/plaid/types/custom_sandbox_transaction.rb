# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Data to populate as test transaction data.
    class CustomSandboxTransaction < Internal::Types::Model
      field :date_transacted, -> { String }, optional: false, nullable: false

      field :date_posted, -> { String }, optional: false, nullable: false

      field :amount, -> { Float }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: true, nullable: false

      field :account_id, -> { String }, optional: true, nullable: false
    end
  end
end
