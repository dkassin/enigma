require_relative './key'
require 'date'

class Enigma
  include KeyEnumerables

  attr_reader :random_key, :date, :encryptor

  def initialize()
    @random_key = generate_random_key
    @date = date_format
  end

  def encrypt(message,key_input = @random_key, date_input = @date)
    Encryption.new(message,key_input,date_input)
  end
end
