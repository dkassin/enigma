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
    expect(encryptor.message).to eq ("hello world")
    expect(encryptor.key_input).to eq ("02715")
    expect(encryptor.date_input).to eq ("040895")
  end

  it 'can show a character_set' do
  enigma = Enigma.new
  encryptor = Encryption.new("hello world","02715", "040895")
  expected =
              ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
               "k", "l", "m", "n", "o", "p", "q", "r", "s", "t",
               "u", "v", "w", "x", "y", "z", " "]
  expect(encryptor.character_set).to eq (expected)
  end
end
