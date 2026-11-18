# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The image or video capture of a selfie. Only one of `image_url` or `video_url` will be populated per selfie. In
    # the vast majority of sessions Plaid records a short video of the user, so `video_url` is populated and `image_url`
    # is `null`. `image_url` is only populated in the rare passive-liveness fallback case, where the user's device could
    # not complete the standard video liveness capture (for example, a camera or streaming error) and submitted a single
    # still image instead.
    class SelfieCapture < Internal::Types::Model
      field :image_url, -> { String }, optional: false, nullable: true

      field :video_url, -> { String }, optional: false, nullable: true
    end
  end
end
