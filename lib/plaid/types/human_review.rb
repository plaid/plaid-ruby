# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details about the human review check, which refers to a check that is performed by a document specialist.
    class HumanReview < Internal::Types::Model
      field :status, -> { Plaid::Types::HumanReviewStatus }, optional: false, nullable: false
    end
  end
end
