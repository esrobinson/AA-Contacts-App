require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: 'comments/2',
).to_s

body = { :comment => { :user_id => 1, :contact_id => 1, :comment => "this is a comment" } }

puts RestClient.put(url, body)