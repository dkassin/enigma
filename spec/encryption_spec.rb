require 'date'
require './lib/enigma'
require './lib/encryption'
require 'simplecov'
SimpleCov.start

describe Encryption do
  it 'exists' do
    enigma = Enigma.new
    encryptor = Encryption.new("hello world","02715", "040895")
    expected =
              {
                "A" => 3,
                "B" => 27,
                "C" => 73,
                "D" => 20 }

    expect(encryptor).to be_a Encryption
    expect(encryptor.message).to eq ("hello world")
    expect(encryptor.key_input).to eq ("02715")
    expect(encryptor.date_input).to eq ("040895")
    expect(encryptor.final_shift).to eq(expected)
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

  it 'can return a hash of shifts' do
    enigma = Enigma.new
    encryptor = Encryption.new("hello world","02715", "040895")
    expected =
              {
                "A" => 3,
                "B" => 27,
                "C" => 73,
                "D" => 20 }
  # key_hash = encryptor.keys_hash
  # offset_hash = encryptor.offset_hash

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
    expect(encryptor.keys_hash).to eq (expected)
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
    expect(encryptor.offset_hash).to eq (expected)
  end

  it 'can show a shift for A' do
    enigma = Enigma.new
    encryptor = Encryption.new("hello world","02715", "040895")

    expect(encryptor.a_shift).to be_a Hash
    expect(encryptor.a_shift.length).to eq 27
    expect(encryptor.a_shift["a"]).to eq ('d')
  end

  it 'can show a shift for B' do
    enigma = Enigma.new
    encryptor = Encryption.new("hello world","02715", "040895")

    expect(encryptor.b_shift).to be_a Hash
    expect(encryptor.b_shift.length).to eq 27
    expect(encryptor.b_shift["a"]).to eq ('a')
  end

  it 'can show a shift for C' do
    enigma = Enigma.new
    encryptor = Encryption.new("hello world","02715", "040895")

    expect(encryptor.c_shift).to be_a Hash
    expect(encryptor.c_shift.length).to eq 27
    expect(encryptor.c_shift["a"]).to eq ('t')
  end

  it 'can show a shift for D' do
    enigma = Enigma.new
    encryptor = Encryption.new("hello world","02715", "040895")

    expect(encryptor.d_shift).to be_a Hash
    expect(encryptor.d_shift.length).to eq 27
    expect(encryptor.d_shift["a"]).to eq ('u')
  end


end
