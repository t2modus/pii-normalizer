# frozen_string_literal: true

module PII
  module Normalization
    # this module is intended to normalize
    module EmailNormalizer
      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

      def normalize_email(email)
        return nil if email.blank?
        return email.downcase if email =~ VALID_EMAIL_REGEX
      end
    end
  end
end
