# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information on an issue encountered with financial institution interactions during Linking.
    class Issue < Internal::Types::Model
      field :issue_id, -> { String }, optional: true, nullable: false

      field :institution_names, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :institution_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false

      field :summary, -> { String }, optional: true, nullable: false

      field :detailed_description, -> { String }, optional: true, nullable: false

      field :status, -> { Plaid::Types::IssuesStatus }, optional: true, nullable: false
    end
  end
end
