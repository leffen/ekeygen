# encoding: utf-8

require 'test_helper'

class DefaultTest < Test::Unit::TestCase

  def setup
    @data = 'Rødhette og ulven'
    @key = 'Test1234!0123456789'
    @vector = '12345678901234567890FFFF'
    @enc = Cryptomania.new

  end

  def teardown
  end

  # Testing that the encryption adn decryption works
  def test_the_truth
    enc_data = @enc.encrypt(@data,@key)

    data_decrypted = @enc.decrypt(enc_data[1],@key,enc_data[0])
    assert_equal(@data,data_decrypted,"Decrypted data expected to be #{@data} but where #{data_decrypted}")
  end







end
