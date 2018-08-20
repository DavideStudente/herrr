Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "152633068315-hf2go4qj6h6npgj0om8mcottn8g8ks74.apps.googleusercontent.com", "Sw0MoXndMbicxieyo39RXh9I"
end