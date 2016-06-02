class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :birthday, presence: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validate :checkbirthday

  private 
  def checkbirthday
  	if !self.birthday.nil?  	
  		if self.birthday > Time.now
    		errors.add(:birtday, "cannot be in the future")
  		elsif self.birthday < Time.now - 125.years
    		errors.add(:birthday, "cannot be over 125 years ago")
  		end
  	end
   end
end