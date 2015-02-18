require_relative '../../app/helpers/kajabi_parsley_helper'
require 'active_support/all'
require 'action_view'
require 'active_model'

require 'minitest/autorun'

class TestCase < MiniTest::Test; end

class KajabiParsleyHelperTest < TestCase
  include ActionView::Helpers::TranslationHelper
  include KajabiParsleyHelper

  class SpecMinMaxModel
    include ActiveModel::Model

    attr_accessor :description

    validates :description, length: { in: 10..20 }
  end

  def test_min_max_validations
    data = parsley_minmax(SpecMinMaxModel, :description)

    assert_equal 'keyup', data[:parsley_trigger]
    assert_equal 10, data[:parsley_minlength]
    assert_equal 20, data[:parsley_maxlength]
    assert_equal 'is too short (minimum is 10 characters)', data[:parsley_minlength_message]
    assert_equal 'is too long (maximum is 20 characters)', data[:parsley_maxlength_message]
  end

  class SpecMaxModel
    include ActiveModel::Model

    attr_accessor :description

    validates :description, length: { maximum: 20 }
  end

  def test_max_validations
    data = parsley_max(SpecMaxModel, :description)

    assert_equal 'keyup', data[:parsley_trigger]
    assert_equal 20, data[:parsley_maxlength]
    assert_equal 'is too long (maximum is 20 characters)', data[:parsley_maxlength_message]
  end

  class SpecMinModel
    include ActiveModel::Model

    attr_accessor :description

    validates :description, length: { minimum: 10 }
  end

  def test_min_validations
    data = parsley_min(SpecMinModel, :description)

    assert_equal 'keyup', data[:parsley_trigger]
    assert_equal 10, data[:parsley_minlength]
    assert_equal 'is too short (minimum is 10 characters)', data[:parsley_minlength_message]
  end
end
