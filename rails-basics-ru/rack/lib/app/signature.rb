# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = @app.call(env)
    body = body.each_with_object([]) do |line, result|
      result << line << Digest::SHA256.hexdigest(line)
    end
    [status, headers, body]
    # END
  end
end
