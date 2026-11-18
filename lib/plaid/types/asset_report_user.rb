# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The user object allows you to provide additional information about the user to be appended to the Asset Report.
    # All fields are optional. The `first_name`, `last_name`, and `ssn` fields are required if you would like the Report
    # to be eligible for Fannie Mae's Day 1 Certainty™ program.
    class AssetReportUser < Internal::Types::Model
      field :client_user_id, -> { String }, optional: true, nullable: true

      field :first_name, -> { String }, optional: true, nullable: true

      field :middle_name, -> { String }, optional: true, nullable: true

      field :last_name, -> { String }, optional: true, nullable: true

      field :ssn, -> { String }, optional: true, nullable: true

      field :phone_number, -> { String }, optional: true, nullable: true

      field :email, -> { String }, optional: true, nullable: true
    end
  end
end
