require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require 'pry-state'
require './lib/decryptor'
require './lib/enigma'

class DecryptorTest < Minitest::Test

  def test_instance_of_class
    d = Decryptor.new("hello", "12345")

    assert_instance_of Decryptor, d
  end

  def test_decrypt_pulls_encrypted_file
    d = Decryptor.new("hello", "12345")
    output = d.output

    assert_equal "hello", output
  end

  def test_access_to_key
    e = Enigma.new
    output = e.encrypt("hello")
    key = e.key
    d = Decryptor.new(output, key)
    refute_nil d
  end

  def test_storage_of_offset_values_on_enigma_class
    e = Enigma.new
    output = e.encrypt("hello")

    refute_nil e.offset
    assert_equal 4, e.offset.length
  end

  def test_decryptor_access_to_encrypted_message
    e = Enigma.new
    output = e.encrypt("hello")
    key = e.key
    e.decrypt(output, key)

    refute_nil output
    refute_equal "hello", output
  end



end
