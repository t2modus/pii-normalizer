# frozen_string_literal: true

module PII
  module Normalization
    # This module normalizes addresses... as one might expect
    module AddressNormalizer
      NORMALIZED_ABBREVIATIONS = { 'apartment' => 'apt', 'avenue' => 'ave', 'basement' => 'bsmt', 'boulevard' => 'blvd',
                                   'building' => 'bldg', 'bypass' => 'byp', 'center' => 'ctr', 'floor' => 'fl',
                                   'forest' => 'frst', 'hill' => 'hl', 'plaza' => 'plz', 'street' => 'st',
                                   'lane' => 'ln', 'road' => 'rd', 'drive' => 'dr', '#' => 'apt', 'village' => 'vlg',
                                   'parkway' => 'pkwy', 'highway' => 'hwy' }.freeze
      ADDRESS_SUBSTITUTION = /#{NORMALIZED_ABBREVIATIONS.keys.join('|')}/i.freeze

      def normalize_address(address)
        address&.downcase&.gsub(ADDRESS_SUBSTITUTION) { |m| NORMALIZED_ABBREVIATIONS.fetch(m, m) }
      end

      # removes non-numeric chars then gets first 5 chars
      def normalize_zip(zip)
        return nil if zip.blank?

        zip = zip.tr('^0-9', '')[0...5]
        zip.length < 5 ? nil : zip
      end
    end
  end
end
