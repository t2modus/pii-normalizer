# frozen_string_literal: true

module PII
  module Normalization
    VALID_US_PHONE_REGEX = /^1?[2-9]\d{2}[2-9]\d{6}$/.freeze

    # This module is responsible for normalizing phone numbers. Seems pretty self explanatory really,
    # I probably wouldn't even bother to explain it except rubocop
    module PhoneNormalizer
      def normalize_phone(phone_number)
        phone = phone_number&.tr('^0-9', '') # removes non-numeric chars
        return nil if phone.blank?
        return phone[-10..-1] if phone =~ VALID_US_PHONE_REGEX
      end
    end
  end
end
