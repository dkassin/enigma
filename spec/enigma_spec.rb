require 'date'
require './lib/enigma'
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


    expect(enigma.encrypt("hello world","02715", "040895")).to be_a Encryption
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



end
