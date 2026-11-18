# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The request was flagged by Plaid's fraud system and requires additional verification to ensure the user is not a
    # bot.
    class RecaptchaRequiredError < Internal::Types::Model
      field :error_type, -> { String }, optional: false, nullable: false

      field :error_code, -> { String }, optional: false, nullable: false

      field :display_message, -> { String }, optional: false, nullable: true

      field :http_code, -> { Integer }, optional: false, nullable: false

      field :link_user_experience, -> { String }, optional: true, nullable: false

      field :common_causes, -> { String }, optional: true, nullable: false

      field :troubleshooting_steps, -> { String }, optional: true, nullable: false
    end
  end
end
