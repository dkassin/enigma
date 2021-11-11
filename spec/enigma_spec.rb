require './lib/enigma'
require 'simplecov'
SimpleCov.start

describe Enigma do
  it 'exists' do
    enigma = Enigma.new

    expect(enigma).to be_a Enigma
  end

  it 'can encrypt' do
    enigma = Enigma.new
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
              }

    expect(enigma.encrypt("hello world", "02715", "040895")).to eq (expected)
  end
end
