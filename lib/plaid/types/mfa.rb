# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specifies the multi-factor authentication settings to use with this test account
    class Mfa < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false

      field :question_rounds, -> { Float }, optional: true, nullable: false

      field :questions_per_round, -> { Float }, optional: true, nullable: false

      field :selection_rounds, -> { Float }, optional: true, nullable: false

      field :selections_per_question, -> { Float }, optional: true, nullable: false
    end
  end
end
