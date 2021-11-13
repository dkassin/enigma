require_relative './encryption_module'

class Encryption
  include EncryptionEnumerables

  attr_reader :message, :key_input, :date_input, :character_set

  def initialize(message,key_input, date_input)
    @message = message
    @key_input = key_input
    @date_input = date_input
    @character_set = ("a".."z").to_a << " "
  end
end
