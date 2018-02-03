OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '792580465886-d830jej1bhpks1bflr0facqoorov0cen.apps.googleusercontent.com', 'i7dv9g4dBQDkuSXB9lS7EF3Q', skip_jwt: true
end
#  {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}
