require './lib/enigma'
require 'simplecov'
SimpleCov.start

describe Enigma do
  it 'exists' do
    enigma = Enigma.new

    expect(enigma).to be_a Enigma
    expect(enigma.random_key.length).to eq 5
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


end
