require 'date'

class Enigma

  attr_reader :letters

  def initialize
    @letters = ('a'..'z').to_a << ' '
    # @messege = messege
    @key = random_key
    # @date = ' '
    @dates = ' '
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
    @keys = {A: @key[0..1].join.to_i, B: @key[1..2].join.to_i, C: @key[2..3].join.to_i, D: @key[3..4].join.to_i}
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
    @dates = {A: @date_squared[0].to_i, B: @date_squared[1].to_i,  C: @date_squared[2].to_i,  D: @date_squared[3].to_i}
  end

  # {A: keys[0] + date[0]
    # B: keys[1] + date[1]
    # C: keys[2] + date[2]
    # D: keys[3] + date[3]}

  def offsets
    @keys.merge!(@dates){ |k, i, q| i + q }
  end 


end