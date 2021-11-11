require 'date'
require './lib/enigma'
require './lib/encryption'
require 'simplecov'
SimpleCov.start

describe Encryption do
  it 'exists' do
    enigma = Enigma.new
    encryptor = Encryption.new("hello world","02715", "040895")
    expect(encryptor).to be_a Encryption
  end
end
