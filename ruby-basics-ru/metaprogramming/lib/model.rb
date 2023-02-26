# frozen_string_literal: true

# BEGIN
module Model
  def initialize(params = {})
    self.class.attribute_list.each do |key, value|
      send("#{key}=", value)
    end

    params.each do |key, value|
      send("#{key}=", value)
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  def attributes
    self.class.attribute_list.keys.each_with_object({}) do |attr_name, result|
      result[attr_name] = send(attr_name)
    end
  end

  module ClassMethods
    require 'date'

    def attribute_list
      @attribute_list ||= {}
    end

    def new(*arguments, &block)
      instance = allocate
      instance.send(:initialize, *arguments, &block)
      instance
    end

    def attribute(name, options = {})
      attribute_list[name] = options[:default]

      define_method name do
        casted_value(instance_variable_get("@#{name}"), options[:type])
      end

      define_method "#{name}=" do |value|
        instance_variable_set "@#{name}", value
      end
    end
  end

  private

  def casted_value(attr_value, attr_type)
    return nil if attr_value.nil?

    case attr_type
    when :integer then attr_value.to_i
    when :string then attr_value.to_s
    when :boolean then attr_value.equal?(true)
    when :datetime then DateTime.parse(attr_value.to_s)
    else attr_value
    end
  end

  def method_missing(method_name, *arguments)
    super unless method_name.to_s.end_with?('=')
  end

  def respond_to_missing?(method_name, include_private = false)
    if method_name.to_s.end_with?('=')
      false
    else
      super
    end
  end
end
# END
