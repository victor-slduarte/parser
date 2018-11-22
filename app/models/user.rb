class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  has_many :angels

  def send_sms
    account_sid = "ACa3f89f1058ccd3e0239c909a0f41216c" # Your Account SID from www.twilio.com/console
    auth_token = "c68f3877a9bba3bfba3073ae85d99d47"   # Your Auth Token from www.twilio.com/console
    @client = Twilio::REST::Client.new account_sid, auth_token
    self.angels.each do |angel|
      message = @client.messages.create(
          body: "#{angel.first_name.capitalize} #{angel.last_name.capitalize},

#{self.first_name.capitalize} está em perigo! Acesse o link para ver sua localização ao vivo: www.parserapp.com/users/#{self.id}/map",
          to: "#{angel.phone_number}", # Replace with your phone number
          from: "+12053955462")     # Replace with your Twilio number
      puts message.sid
    end
    puts "angels are comming"
  end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end
end
