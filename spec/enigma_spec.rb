require_relative 'spec_helper.rb'
require './lib/enigma'
# require 'date'

RSpec.describe Enigma do

  before :each do
    @enigma = Enigma.new
  end

  it 'can encrypt a message with a key and date' do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(
      {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    })

  end

  it 'can decrypt a message with a key and date' do
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(
    {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    })
  end 

  it 'can encrypt a message with a key (uses todays date' do 
    expect(@encrypted = @enigma.encrypt("hello world", "02715")).to be_a Hash
  #=> # encryption hash here
  end

  it 'can decrypt a message with a key (uses todays date)'do
    expect(@enigma.decrypt(encrypted[:encryption], "02715")).to be_a Hash
  #=> # decryption hash here
  end

  it 'can encrypt a message (generates random key and uses todays date)' do
    expect(@enigma.encrypt("hello world")).to be_a Hash
  #=> # encryption hash here
  end

end