class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :questions
  has_many :answers
  has_many :question_upvotes

  def ensure_authentication_token
  	self.authentication_token = generate_authentication_token
  	self.save!
  	self.authentication_token
  end

  def send_password_reset
  	generate_token(:reset_password_token)
  	self.reset_password_sent_at = Time.zone.now
  	save!
  	UserMailer.password_reset(self).deliver_now
  end

  def generate_token(column)
  	begin
  		self[column] = SecureRandom.urlsafe_base64
  	end while User.exists?(column => self[column])
  end

  private

  def generate_authentication_token
  	loop do
  		token = Devise.friendly_token
  		break token unless User.where(authentication_token: token).first
  	end
  end
end
