require "test_helper"

class PII::NormalizerTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::PII::Normalizer::VERSION
  end
end
