class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.find_for_facebook_oauth access_token
    if user = User.where(:url => access_token.info.urls.Facebook).first
       user
    else 
      User.create!(:provider => access_token.provider, 
      	:url => access_token.info.urls.Facebook, 
       :email => access_token.extra.raw_info.email,
      	:password => Devise.friendly_token[0,20], 
       :username => access_token.extra.raw_info.first_name) 
    end
end
end
