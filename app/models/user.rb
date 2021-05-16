class User < ApplicationRecord
  validates :username, uniqueness: true
  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first_or_initialize
    user.update(
      name: auth.info.name,
      email: auth.info.email,
      username: auth.info.nickname,
      token: auth.credentials.token,
      refresh_token: auth.credentials.refresh_token
    )
    user
  end
end
