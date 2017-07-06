class UserToken < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :token, presence: true, length: {maximum: 255}
  validates :expired_at, presence: true

  class << self
    def generate
      new.renew!
    end
  end

  def renew!
    update_attributes! token: secured_gen_str(:token), expired_at: Time.zone.now + 30.minutes
    self
  end

  def expired?
    expired_at <= Time.zone.now
  end

  def expire!
    update_attributes! expired_at: Time.zone.now
  end
end
