require 'twilio-ruby'

account_sid = 'AC6324084fd5f4d223110cb41aba8abdb8'
auth_token = '4cee683f49583c3dbe665f855d6ae7c3'

client = Twilio::REST::Client.new(AC6324084fd5f4d223110cb41aba8abdb8, 4cee683f49583c3dbe665f855d6ae7c3)

from: '+12057327602', 
to: '+17025953282',

client.messages.create(
 from: from, 
 to: to,
 body: 'Hello world!'
)