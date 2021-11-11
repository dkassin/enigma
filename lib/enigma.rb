require_relative './key'

class Enigma
  include KeyEnumerables

  attr_reader :random_key

  def initialize()
    @random_key = generate_random_key
  end

  def encrypt(message,key_input = @random_key, date_input = "040895")
    encrypt = {
      encryption: 0,#encryption_method(message)
      key: key_input, #should randomly generate a key
      date: date_input
    }
  end
end
