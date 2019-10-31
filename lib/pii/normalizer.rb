# frozen_string_literal: true

require 'pii/normalizer/version'
require_relative 'normalization/all_normalizers'

module PII
  # This class provides an actual implementation we can use in case we don't want
  # to actually include the individual normalizers in any classes in the project
  # where we end up including everything.
  class Normalizer
    extend ::PII::Normalization::AllNormalizers
  end
end
