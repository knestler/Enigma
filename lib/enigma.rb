
  require 'date'

  class Enigma

    attr_reader :letters

    def initialize
      @letters = ('a'..'z').to_a << ' '
      @key = random_key  
    end

    # def encrypt(message, key, date)
      
    #     encryption = message.downcase.chars.each_with_index.map do |letter, index|
    #         if index % 4 == 0
    #           require 'pry'; binding.pry
    #           letter.a_shift 
    #           return
    #         end
    #       end
    #     encrypted = {encryption: messege, key: key, date: date}
    # end
  

    def random_key
      5.times.map {rand(0..9)}
    end 

    def keys
      @keys = {A: @key[0..1].join.to_i, B: @key[1..2].join.to_i, C: @key[2..3].join.to_i, D: @key[3..4].join.to_i}
    end 

    def generate_date
      @date = Date.today.strftime("%d%m%y")
    end

    def dates 
      date_squared = (@date.to_i * @date.to_i).to_s[-4..-1]
      
      @dates = {A: date_squared[0].to_i, B: date_squared[1].to_i,  C: date_squared[2].to_i,  D: date_squared[3].to_i}
    end

    def offsets
      @keys.merge!(@dates){ |o, k, d| k + d }
    end 

    def a_shift   
      @letters.rotate(@keys[:A])
    end

    def b_shift   
      @letters.rotate(@keys[:B])
    end

    def c_shift   
      @letters.rotate(@keys[:C])
    end

    def d_shift   
      @letters.rotate(@keys[:D])
    end



  end



