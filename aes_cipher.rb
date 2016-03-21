require 'openssl'
require 'json'
require 'base64'

# AES Cipher
module AesCipher
  def self.encrypt(document, key)
    # TODO: Return JSON string of array: [iv, ciphertext]
    #       where iv is the random intialization vector used in AES
    #       and ciphertext is the output of AES encryption
    # NOTE: Use base64 for ciphertext so that it is screen printable
    #       Use cipher block chaining mode only!
    cipher = OpenSSL::Cipher::AES256.new(:CBC)
    cipher.encrypt # init
    cipher.key = Digest::SHA256.digest(key.to_s)
    iv = cipher.random_iv
    ciphertext = cipher.update(document.to_s) + cipher.final
    [Base64.encode64(iv), Base64.encode64(ciphertext)].to_json
  end

  def self.decrypt(aes_crypt, key)
    # TODO: decrypt from JSON output (aes_crypt) of encrypt method above
    decipher = OpenSSL::Cipher::AES256.new(:CBC)
    iv, ciphertext = JSON.parse(aes_crypt).map(&Base64.method(:decode64))
    decipher.decrypt
    decipher.key = Digest::SHA256.digest(key.to_s)
    decipher.iv = iv
    doc = decipher.update(ciphertext) + decipher.final
    doc
  end
end
