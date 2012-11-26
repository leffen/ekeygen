require 'symmetric-encryption'
require 'base64'
require 'securerandom'

class Cryptomania
  VECTOR_SIZE=24

  def encrypt(data,key,ciper='aes-128-cbc')
    init_vector = SecureRandom.base64( VECTOR_SIZE )
    SymmetricEncryption.cipher = SymmetricEncryption::Cipher.new(:key => key,:iv => init_vector,:cipher => ciper )
    [Base64.urlsafe_encode64(init_vector), Base64.urlsafe_encode64(SymmetricEncryption.encrypt(data)) ]
  end

  # encrypted data is expected to be in base 64 format
  def decrypt(base64_encrypted_data,key,base64_init_vector,ciper='aes-128-cbc')
    SymmetricEncryption.cipher = SymmetricEncryption::Cipher.new(:key => key,:iv => Base64.urlsafe_decode64(base64_init_vector), :cipher => ciper )
    SymmetricEncryption.decrypt(Base64.urlsafe_decode64(base64_encrypted_data))
  end

end