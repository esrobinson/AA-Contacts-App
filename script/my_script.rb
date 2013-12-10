require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users',
).to_s

body = { :user => { :email => 'email@email.email' } }

puts RestClient.post(url, body)