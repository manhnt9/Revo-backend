class User < ApplicationRecord
  ROLES = {
    member: 0,
    admin: 1
  }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  enum role: ROLES

  has_many :user_tokens

  validates :email, presence: true, length: {maximum: 50}, uniqueness: true,
    format: {with: Regexp.new(VALID_EMAIL_REGEX, Regexp::IGNORECASE)}
  validates :password, presence: true, length: {minimum: 6, maximum: 8}
  validates :role, presence: true

  class << self
    def from_access_token token
      user_token = UserToken.find_by token: token
      return unless user_token
      raise APIError::TokenExpired if user_token.expired?
      user_token.user
    end
  end
end
