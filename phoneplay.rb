require 'rubygems'
require 'sinatra'
require 'twilio'

Twilio.connect(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])

RECORDINGS = YAML.load_file('mp3s.yml')

get '/' do
  content_type :text
  RECORDINGS.inspect
end

post '/voice' do
  verb = Twilio::Verb.new do |v|
    v.play RECORDINGS[:plays][rand(RECORDINGS[:plays].size-1)]
    v.play RECORDINGS[:footer]
  end
  verb.response
end