require 'date'
require './lib/enigma'
require 'simplecov'
SimpleCov.start

describe Enigma do
  it 'exists' do
    enigma = Enigma.new

    expect(enigma).to be_a Enigma
    expect(enigma.random_key.length).to eq 5
    expect(enigma.date).to be_a String
  end

  it 'can encrypt' do
    enigma = Enigma.new
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
              }

    expect(enigma.encrypt("hello world")).to eq (expected)
  end

  it 'can generate_random number as a string' do
    enigma = Enigma.new

    expect(enigma.generate_random).to be_a String
  end

  it 'can generate_random number as a string with a length of 5' do
    enigma = Enigma.new

    expect(enigma.generate_random_key.length).to be 5
  end

end
