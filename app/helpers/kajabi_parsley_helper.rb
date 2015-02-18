module KajabiParsleyHelper
  def parsley_minmax(klass, field)
    min = parsley_min(klass, field)
    max = parsley_max(klass, field)

    min.merge(max)
  end

  def parsley_max(klass, field)
    validator = length_validation_for_parsley(klass, field)

    max = validator.options[:maximum]

    {
      parsley_trigger: 'keyup',
      parsley_maxlength: max,
      parsley_maxlength_message: t('errors.messages.too_long', count: max),
    }
  end

  def parsley_min(klass, field)
    validator = length_validation_for_parsley(klass, field)

    min = validator.options[:minimum]

    {
      parsley_trigger: 'keyup',
      parsley_minlength: min,
      parsley_minlength_message: t('errors.messages.too_short', count: min),
    }
  end

  def length_validation_for_parsley(klass, field)
    klass = klass.is_a?(Class) ? klass : klass.class

    validators = klass.validators.select {|v| v.is_a?(ActiveModel::Validations::LengthValidator)}
    validators.detect { |v| v.attributes == [field.to_sym] }
  end
end

