# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    locale = user_locale(env)

    app_locale = switch_locale(locale)

    status, headers, body = @app.call(env)
    headers['Content-Language'] = app_locale.to_s

    [status, headers, body]
  end

  private

  def user_locale(env)
    request = Rack::Request.new(env)
    return if request.accept_language.blank?

    request.accept_language.first.first.split('-').first.to_sym
  end

  def switch_locale(locale)
    I18n.locale = if I18n.available_locales.include? locale
                    locale
                  else
                    I18n.default_locale
                  end
  end
end
