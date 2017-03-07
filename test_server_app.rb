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
    skip
    response = get("/lorem/standard")
    assert_includes(response.body, "adipisicing", "ullamco")
  end

  def test_lorem_zombie
    skip
    response = get("/lorem/zombie")
    assert_includes(response.body, "Zombie", "brains")
  end

  def test_lorem_herpderp
    skip
    response = get("/lorem/herpderp")
    assert_includes(response.body, "derpsu", "derperker")
  end

  def test_lorem_bacon_count
    response = get("/lorem/bacon?paragraphs=3")
    assert_includes(response.body, "Tenderloin", "kielbasa")
  end

end
