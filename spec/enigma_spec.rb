require 'date'
require './lib/enigma'
require './lib/encryption'
require 'simplecov'
SimpleCov.start

describe Enigma do
  it 'exists' do
    enigma = Enigma.new

    expect(enigma).to be_a Enigma
    expect(enigma.random_key).to be_a String
    expect(enigma.random_key.length).to eq 5
    expect(enigma.date).to be_a String
    expect(enigma.date.length).to eq 6
  end

  it 'can encrypt' do
    enigma = Enigma.new
    expected = {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                }

    expect(enigma.encrypt("hello world","02715", "040895")).to eq(expected)
  end

  it 'can decrypt' do
    enigma = Enigma.new
    expected = {
                  decryption: "hello world",
                  key: "02715",
                  date: "040895"
                }

    expect(enigma.decrypt("keder ohulw","02715", "040895")).to eq(expected)
  end

  it 'can generate_random number as a string' do
    enigma = Enigma.new

    expect(enigma.generate_random).to be_a String
  end

  it 'can generate_random number as a string with a length of 5' do
    enigma = Enigma.new

    expect(enigma.generate_random_key.length).to be 5
  end

  it 'can format date to be six integers and a string' do
    enigma = Enigma.new

    expect(enigma.date_format).to be_a String
    expect(enigma.date_format.length).to eq 6
  end

  it 'can encrypt a message with a key (uses todays date)' do
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world","02715")
    expect(encrypted).to be_a Hash
    expect(encrypted[:key]).to eq("02715")
  end

  it 'decrypt a message with a key (uses todays date)' do
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world","02715")
    decrypted = enigma.decrypt(encrypted[:encryption], "02715")
    expect(decrypted).to be_a Hash
    expect(decrypted[:key]).to eq("02715")
    expect(decrypted[:decryption]).to eq("hello world")
  end

  it 'encrypt a message (generates random key and uses todays date)' do
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world")
    require "pry"; binding.pry
    expect(encrypted).to be_a Hash
  end
end
