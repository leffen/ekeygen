require 'symmetric-encryption'
require 'base64'
require 'securerandom'

class Cryptomania
  VECTOR_SIZE=24

  def encrypt(data,key,init_vector=nil,ciper='aes-128-cbc')
    init_vector = SecureRandom.base64( VECTOR_SIZE ) unless init_vector

    SymmetricEncryption.cipher = SymmetricEncryption::Cipher.new(
      :key => key,
      :iv => init_vector,
      :cipher => ciper
    )


    [init_vector, "\"#{Base64.urlsafe_encode64(SymmetricEncryption.encrypt(data))}\"" ]
  end

  # encrypted data is expected to be in base 64 format
  def decrypt(base64_encrypted_data,key,init_vector,ciper)
    SymmetricEncryption.cipher = SymmetricEncryption::Cipher.new(
      :key => key,
      :iv => init_vector,
      :cipher => ciper
    )

    encrypted_data = Base64.urlsafe_decode64(base64_encrypted_data)
    SymmetricEncryption.decrypt(data)
  end

end