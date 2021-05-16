class User < ApplicationRecord
  validates :username, uniqueness: true
  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first_or_initialize
    user.update(
      name: auth.info.display_name,
      email: auth.info.email,
      username: auth.info.id,
      token: auth.credentials.token,
      refresh_token: auth.credentials.refresh_token
    )
    user
  end

  def spotify
    RSpotify::User.new(
    {
      'credentials' => {
        "token" => self.token,
        "refresh_token" => self.refresh_token
      } ,
      'id' => self.username
    })
  end
end
