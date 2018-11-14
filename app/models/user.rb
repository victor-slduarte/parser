class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :angels

  def send_wpp_messages
    account_sid = 'AC90f8ca48054e700aee47aa18760bf5e8'
    auth_token = '7ca1809b6aa72e9e5cf7a58af46ce39d'
    @client = Twilio::REST::Client.new(account_sid, auth_token)


    self.angels.each do |angel|
      message = @client.messages.create(
                             body: " #{angel.first_name} #{angel.last_name},
                             #{self.first_name} #{self.last_name} pode estar com problemas!
                             Clique no link para ver sua localização ao vivo:
                             LINK AQUI ",

                             from: 'whatsapp:+14155238886',
                             to: "whatsapp:#{angel.phone_number}"
                           )
      puts message.sid
    end
    puts "Angels are coming to help"
  end
end
