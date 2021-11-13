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

  xit 'can return a hash of shifts' do
  enigma = Enigma.new
  encryptor = Encryption.new("hello world","02715", "040895")
  expected =
              {
                "A" => 3,
                "B" => 27,
                "C" => 73,
                "D" => 20 }
  expect(encryptor.final_shift).to eq (expected)
  end

  it 'can return a hash of with letters as keys' do
  enigma = Enigma.new
  encryptor = Encryption.new("hello world","02715", "040895")
  expected =
              {
                "A" => 0 ,
                "B" => 0 ,
                "C" => 0 ,
                "D" => 0 }
  expect(encryptor.hash_setup).to eq (expected)
  end

  it 'can return a hash for the keys' do
  enigma = Enigma.new
  encryptor = Encryption.new("hello world","02715", "040895")
  expected =
              {
                "A" => 02 ,
                "B" => 27 ,
                "C" => 71 ,
                "D" => 15 }
  expect(encryptor.keys_hash(encryptor.key_input)).to eq (expected)
  end

  it 'can return a hash for the offset' do
  enigma = Enigma.new
  encryptor = Encryption.new("hello world","02715", "040895")
  expected =
              {
                "A" => 1 ,
                "B" => 0 ,
                "C" => 2 ,
                "D" => 5 }
  expect(encryptor.offset_hash(encryptor.date_input)).to eq (expected)
  end


end
