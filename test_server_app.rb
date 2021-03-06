ENV['RACK_ENV'] = 'test'

require "minitest/autorun"
require "minitest/pride"
require "minitest/focus"
require 'rack/test'
require_relative 'server_app'

class ServerAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    ServerApp
  end

  def test_can_get_the_root_path
    response = get("/")
    assert response.ok?
  end

  def test_welcome_message
    response = get("/")
    assert_equal "Hello! Welcome to my website!", response.body
  end

  def test_name_message
    response = get("/billy")
    assert response.ok?
  end

  def test_name_message
    response = get("/billy?name=Robby")
    assert_equal "Hello Robby! Welcome to my website!", response.body
  end

  def test_lorem_standard
    response = get("/lorem/standard")
    assert_instance_of(String, response.body)
  end

  def test_lorem_zombie
    response = get("/lorem/zombie")
    assert_instance_of(String, response.body)
  end

  def test_lorem_herpderp
    response = get("/lorem/herpderp")
    assert_instance_of(String, response.body)
  end

  def test_lorem_bacon
    response = get("/lorem/bacon")
    assert_instance_of(String, response.body)
  end

end
