require 'rspotify/oauth'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, Rails.application.credentials.spotify[:client_id], Rails.application.credentials.spotify[:client_secret], scope: %w(
    playlist-read-private
    user-read-private
    user-read-email
    user-read-playback-state
    user-modify-playback-state
    user-library-read
    user-read-recently-played
  ).join(' ')
end