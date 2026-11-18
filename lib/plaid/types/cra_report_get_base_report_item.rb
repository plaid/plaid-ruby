# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An Item included in a Base Report returned by `/cra/report/get`.
    class CraReportGetBaseReportItem < Internal::Types::Model
      field :item_id, -> { String }, optional: false, nullable: false

      field :institution_id, -> { String }, optional: false, nullable: false

      field :institution_name, -> { String }, optional: false, nullable: false

      field :date_last_updated, -> { String }, optional: false, nullable: false

      field :accounts, -> { Internal::Types::Array[Plaid::Types::CraReportGetBaseReportAccount] }, optional: false, nullable: false
    end
  end
end
