require 'date'

class Enigma

  attr_reader :letters

  def initialize
    @letters = ('a'..'z').to_a << ' '
    

  end

  def encrypt(messege, key, date)
    # encrypted = key[0]
    # hash = {encryption: messege, key: key, date: date}
    # return hash
  end

  def generated_key
    5.times.map {rand(0..9)}
  end 

    # A << key[0,2].to_i
    # B << key[1,2].to_i
    # C << key[2,2].to_i
    # D << key[3,2].to_i

  def keys
    key_hash = Hask.new(A: @key[0..1].to_i, B: @key[1..2].to_i, C: @key[2..3].to_i, D: @key[3..4].to_i)
  end



end