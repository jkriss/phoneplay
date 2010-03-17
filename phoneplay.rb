require 'rubygems'
require 'sinatra'
require 'twilio'

Twilio.connect(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])

RECORDINGS = %w{
  http://mp3.com/1
  http://mp3.com/2
  http://mp3.com/3
  http://mp3.com/4
}

FOOTER = "http://mp3.com/footer"

post '/voice' do
  verb = Twilio::Verb.new do |v|
    v.play RECORDINGS[rand(RECORDINGS.size-1)]
    v.play FOOTER
  end
  verb.response
end