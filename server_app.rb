require "sinatra/base"
require "pry"
require "httparty"
require_relative "ipsum"

class ServerApp < Sinatra::Base

get "/" do
  "Hello, welcome to my website!"
end

get "/billy" do
  result = params["name"]
  "Hello #{result}! Welcome to my website!"
end

get "/lorem/herpderp" do
  body(Ipsum.herpderp)
end

get "/lorem/bacon" do
  body(Ipsum.bacon)
end

get "/lorem/zombie" do
  body(Ipsum.zombie)
end

get "/lorem/standard" do
  body(Ipsum.standard)
end

run! if app_file == $PROGRAM_NAME
end
