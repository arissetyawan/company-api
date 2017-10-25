class User < ApplicationRecord
  after_create :generate_token
  
  def generate_token
    update_attribute(:token, Digest::SHA256.hexdigest("#{Time.now}#{srand()}"))
  end
end
