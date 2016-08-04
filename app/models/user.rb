class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  attr_accessor :followed
  attr_accessor :follower_count

  has_attached_file :avatar

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true
  validates :email, presence: true
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_many :questions
  has_many :answers
  has_many :question_upvotes
  has_many :reports, as: :reportable
  has_many :item_comments, as: :commentable
  has_many :followers, as: :followable
  has_many :notifications, as: :notifiable
  has_many :bug_reports

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

  def is_followed?(id)
      if self.followers.where(user_id: id).empty?
        self.followed = false;
      else
        self.follower_count = self.followers.count
        self.followed = true;
      end
  end

  private

  def generate_authentication_token
  	loop do
  		token = Devise.friendly_token
  		break token unless User.where(authentication_token: token).first
  	end
  end
end
