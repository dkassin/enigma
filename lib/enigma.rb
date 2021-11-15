require_relative './key'
require 'date'

class Enigma
  include KeyEnumerables

  attr_reader :random_key, :date, :encryption

  def initialize()
    @random_key = generate_random_key
    @date = date_format
    @encryption = nil
  end

  def encrypt(message,key_input = @random_key, date_input = @date)
    @encryption = Encryption.new(message,key_input,date_input)
    encrypt_hash =
                  {
                    encryption: @encryption.encryptor,
                    key: key_input,
                    date: date_input
                  }
  end

  def decrypt(message,key_input = @random_key, date_input = @date)
    @encryption = Encryption.new(message,key_input,date_input)
    decrypt_hash =
                  {
                    decryption: @encryption.encryptor(-1),
                    key: key_input,
                    date: date_input
                  }
  end
end
