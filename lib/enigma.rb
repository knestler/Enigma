require 'date'

class Enigma

  attr_reader :letters

  def initialize
    @letters = ('a'..'z').to_a << ' '
    # @messege = messege
    @key = random_key
    @date = ' '
    # @dates = ' '
  end

  def encrypt(messege, key, date)
    # encrypted = key[0]
    # hash = {encryption: messege, key: key, date: date}
    # return hash
  end

  def random_key
    5.times.map {rand(0..9)}
  end 
    # A << key[0,2].to_i
    # B << key[1,2].to_i
    # C << key[2,2].to_i
    # D << key[3,2].to_i

  def keys
    {A: @key[0..1], B: @key[1..2], C: @key[2..3], D: @key[3..4]}
  end 

  def generate_date
    @date = Date.today.strftime("%d%m%y")
  end

    # A << date[0]
    # B << date[1]
    # C << date[2]
    # D << date[3]

  def dates 
    @date_squared = (@date.to_i * @date.to_i).to_s[-4..-1]
    @dates = {A: @date_squared[0].to_i, B: @date_squared[1].to_i,  c: @date_squared[2].to_i,  D: @date_squared[3].to_i}
  end


end