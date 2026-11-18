# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A representation of an Item within an Employment Refresh Report.
    class CraEmploymentRefreshReportItem < Internal::Types::Model
      field :accounts, -> { Internal::Types::Array[Plaid::Types::CraEmploymentRefreshReportAccount] }, optional: false, nullable: false

      field :institution_name, -> { String }, optional: false, nullable: false

      field :institution_id, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :last_update_time, -> { String }, optional: false, nullable: false
    end
  end
end
