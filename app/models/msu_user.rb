class MsuUser < ApplicationRecord

  attr_accessor :remember_token
  validates :name, presence: true,
                   uniqueness: true,
                   length: {minimum: 3, maximum: 16}
  validates :password, presence: true, length: {minimum: 8, maximum: 100}

  has_secure_password

  def MsuUser.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def MsuUser.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = MsuUser.new_token
    update_attribute(:remember_digest, MsuUser.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

end
