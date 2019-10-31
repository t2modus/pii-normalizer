# frozen_string_literal: true

require_relative 'constants'
require 'active_support/core_ext/object/blank'

module PII
  module Normalization
    # This class is responsible for all logic related to name normalization
    module NameNormalizer
      include Constants
      NAME_SUFFIX = %w[I II III IV JR SR].freeze

      def normalize_names(name, first = nil, middle = nil, last = nil)
        name = clean_full_name(name, first, last)&.titleize
        first_name = clean_partial_name(name, first, last, 'first')
        middle_name = clean_name(middle || name, 'middle', middle.present?)&.capitalize
        last_name = clean_partial_name(name, first, last, 'last')
        [name, first_name, middle_name, last_name]
      end

      def clean_full_name(name, first, last)
        if name.present? || (first.present? ^ last.present?)
          clean_name(name.presence || first.presence || last, 'full')
        elsif first.present? && last.present?
          "#{clean_name(first, 'first')} #{clean_name(last, 'last')}"
        end
      end

      def clean_partial_name(name, first, last, position)
        partial_name, opposite_name = position == 'first' ? [first, last] : [last, first]
        name_to_use = partial_name.presence || name.presence || opposite_name.presence
        clean_name(name_to_use, position)&.titleize
      end

      def clean_name(name, position, using_middle = false)
        return nil if name.blank?

        comma = name.include?(',')
        # full names without commas should be returned as is
        return name if !comma && position == 'full'

        sections = name.tr('.', ' ').split(',') # periods are in initials and abvreviations - remove them for simplicity
        words = sections.join(' ').split
        # if name has company words or special characters or numbers in it we return the original name
        if (COMPANY_WORDS & words.map(&:downcase)).any? || words.any? { |word| word =~ /[^a-zA-Z\-']/ }
          return position == 'full' && name || nil
        end

        case position
        when 'full'
          sections.reverse.map(&:strip).join(' ')
        when 'first'
          comma ? sections.last : words.first
        when 'last'
          (comma ? sections.reverse : words).reject { |word| NAME_SUFFIX.include?(word.upcase) }.last
        else
          if using_middle && words.count == 1
            name
          elsif (words.count < 3 || (words.count == 3 && (NAME_SUFFIX & words.map(&:upcase)).any?)) && !using_middle
            nil
          else
            comma ? words.last : words.second
          end
        end
      end
    end
  end
end
