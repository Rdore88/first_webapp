require "sinatra/base"
require "pry"
require "httparty"
require_relative "ipsum"
require_relative 'intro'

class ServerApp < Sinatra::Base

get "/" do
  Intro.general
end

get "/billy" do
  result = params["name"]
  Intro.custom(result)
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
