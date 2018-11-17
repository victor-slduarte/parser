class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :angels

  def send_sms
    account_sid = "ACa3f89f1058ccd3e0239c909a0f41216c" # Your Account SID from www.twilio.com/console
    auth_token = "c68f3877a9bba3bfba3073ae85d99d47"   # Your Auth Token from www.twilio.com/console
    @client = Twilio::REST::Client.new account_sid, auth_token
    self.angels.each do |angel|
      message = @client.messages.create(
          body: "Victor Duarte, Diego pode estar com problemas! Acesse o link para ver sua localização ao vivo: LINK",
          to: "+5513997109702",       # Replace with your phone number
          from: "+12053955462")     # Replace with your Twilio number
      puts message.sid
    end
    puts "angels are comming"
  end
end
