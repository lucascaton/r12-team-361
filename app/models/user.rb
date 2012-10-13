class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :provider, :facebook_uid

  has_many :votes
  has_many :videos

  def self.find_for_facebook(auth)
    where(provider: auth.provider).where(facebook_uid: auth.uid) || User.new
  end
end
