class MsuUser < ApplicationRecord


  def send_login_link
    generate_login_token

    UserMailer.log_in(self).deliver_now
  end

  def generate_login_token
    self.login_token = generate_token
    self.token_generated_at = Time.now.utc
    save!
  end

  def login_link
    "http://localhost:3000/admin/auth?token=#{self.login_token}"
  end

  def login_token_expired?
    Time.now.utc > (self.token_generated_at + token_validity)
  end

  def expire_token!
    self.login_token = nil
    save!
  end


  private

    def generate_token
      100000 + SecureRandom.random_number(899999)
    end

    def token_validity
      30.minutes
    end
end
