# frozen_string_literal: true

module PII
  module Normalization
    # This module is used to normalize vehicle makes and models
    module VehicleNormalizer
      def normalize_vehicle_information(make_or_model)
        make_or_model&.downcase
      end
    end
  end
end
