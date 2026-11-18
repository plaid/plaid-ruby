# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An Item included in a Home Lending VOA report returned by `/cra/report/get`.
    class CraReportGetHomeLendingVoaItem < Internal::Types::Model
      field :accounts, -> { Internal::Types::Array[Plaid::Types::CraReportGetHomeLendingVoaAccount] }, optional: false, nullable: false

      field :institution_name, -> { String }, optional: false, nullable: false

      field :institution_id, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :date_last_updated, -> { String }, optional: false, nullable: false
    end
  end
end
