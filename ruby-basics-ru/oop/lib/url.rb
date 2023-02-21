# frozen_string_literal: true

require 'uri'
require 'forwardable'

# BEGIN
class Url
  extend Forwardable
  include Comparable

  def initialize(address)
    @uri = URI(address)
  end

  def_delegators :uri, :scheme, :host, :port

  def query_params
    return {} if uri.query.nil?

    uri.query.split('&').each_with_object({}) do |param, result|
      key, value = param.split('=')
      result[key.to_sym] = value
    end
  end

  def query_param(key, default_value = nil)
    query_params[key] || default_value
  end

  def to_s
    params = query_params
    query = []
    params.keys.sort.each { |k| query << "#{k}=#{params[k]}" }
    uri.query = query.join('&')
    uri.to_s
  end

  def <=>(other)
    to_s <=> other.to_s
  end

  protected

  attr_reader :uri
end
# END
