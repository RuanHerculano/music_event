Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ENV['ORIGIN_URL']
    resource '*',
      headers: :any,
      expose: ['access-token', 'expiry', 'token-type', 'uid', 'client'],
      methods: [:get, :post, :options, :delete, :put]
  end
end
