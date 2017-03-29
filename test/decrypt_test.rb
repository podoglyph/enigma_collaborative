require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require 'pry-state'
require './lib/decrypt'

class DecryptTest < Minitest::Test

  def test_instance_of_class
    d = Decrypt.new

    assert_instance_of Decrypt, d
  end

  def test_decrypt_pulls_encrypted_file
    d = Decrypt.new("./lib/hello.txt")
    output = d.output

    assert_equal "hello", output
  end

  def test_access_to_key
    e = Encrypt.new
    e.encrypt
    d = Decrypt.new
    access = @access_key

    refute_nil access
  end

end