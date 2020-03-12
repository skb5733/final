require 'twilio-ruby'

# Twilio API here

account_sid = ENV['TWILIO_SID']
auth_token = ENV['TWILIO_TOKEN']
client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_TOKEN'])

from = '+12057327602', 
to = '+17025953282',

client.messages.create(
 from: from, 
 to: to,
 body: 'Hello!'
)