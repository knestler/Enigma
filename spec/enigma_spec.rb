require_relative 'spec_helper.rb'
require './lib/enigma'
# require 'date'

RSpec.describe Enigma do

  before :each do
    @enigma = Enigma.new
  end

  xit 'can encrypt a message with a key and date' do
    @enigma.generate_date
    @enigma.keys
    @enigma.dates
    @enigma.offsets

    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(
      {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    })
  end

  xit 'can decrypt a message with a key and date' do
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(
    {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    })
  end 

  xit 'can encrypt a message with a key (uses todays date' do 
    expect(@encrypted = @enigma.encrypt("hello world", "02715")).to be_a Hash
  #=> # encryption hash here
  end

  xit 'can decrypt a message with a key (uses todays date)'do
    expect(@enigma.decrypt(encrypted[:encryption], "02715")).to be_a Hash
  #=> # decryption hash here
  end

  xit 'can encrypt a message (generates random key and uses todays date)' do
    expect(@enigma.encrypt("hello world")).to be_a Hash
  #=> # encryption hash here
  end

  it 'can generate random 5 diget key' do
    expect(@enigma.random_key.length).to eq 5
  end

  it 'can add random keys to hash' do
    expect(@enigma.keys).to be_a Hash
    expect(@enigma.keys.count).to eq 4
  end

  it 'can generate todays date' do 
    expect(@enigma.generate_date).to eq("090822")
    expect(@enigma.generate_date.length).to eq(6)
  end

  it 'can calculate offsets by date' do
    @enigma.generate_date
    
    expect(@enigma.dates).to be_a Hash
    expect(@enigma.dates.count).to eq 4
  end

  it 'can generate the offset by adding the key and date offset values' do 
    @enigma.generate_date
    @enigma.keys
    @enigma.dates
    
    expect(@enigma.offsets).to be_a Hash
    expect(@enigma.offsets.count).to eq 4
  end

  it 'can shift letters' do 
    @enigma.generate_date
    @enigma.keys
    @enigma.dates
    @enigma.offsets

    expect(@enigma.a_shift.length).to eq 27
    expect(@enigma.b_shift.length).to eq 27
    expect(@enigma.c_shift.length).to eq 27
    expect(@enigma.d_shift.length).to eq 27

  end


end

# Array#rotate
# Date#strftime
# Date::today
# Enumerator#with_index

# Finding the Shifts
# Each shift will be the sum of two other shifts known as the Keys and the Offsets. So the A shift will be the A key plus the A offset, the B shift will be the B key plus the B offset, etc.

# The Keys
# The keys are created by generating a random five digit number, like 02715, and splitting it up like so:

# A key: first two digits (02)
# B key: second and third digits (27)
# C key: third and fourth digits (71)
# D key: fourth and fifth digits (15)
# The Offsets
# The offsets are found using the date of transmission.

# Consider the date formatted as a number, DDMMYY. If the date is August 4, 1995, it would be represented as 040895.
# Square the numeric form (1672401025)
# Take the last four digits (1025)
# A offset: The first digit (1)
# B offset: The second digit (0)
# C offset: The third digit (2)
# D offset: The fourth digit (5)
# Encrypting a Message
# Let’s say we are trying to encrypt the message "hello world".

# Using the previous examples, the keys are 02, 27, 71, 15 and the offsets are 1, 0, 2, 5. So the final shifts would be:

# A: 3
# B: 27
# C: 73
# D: 20
# Our character set is the alphabet and a space like this:

# ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
# If we are trying to encrypt “hello world”, the first character (“h”) is shifted by the A shift (3). So “h” becomes “k”.

# The second character (“e”) is shifted by the B shift (27). Since there are 27 characters in our set, shifting by 27 gets us back to where we started, so “e” becomes “e”.

# The third character (“l”) is shifted by the C shift (73). “l” becomes “d”.

# The fourth character (“l”) is shifted by the D shift (20). “l” becomes “e”.

# When we get to the 5th character (“o”), we cycle back through the shifts, so “o” is shifted by the A shift (3) and becomes “r”. The sixth character (“ “) is shifted by the B shift (27) and becomes “ “.

# The final translation for this example would be:

# “hello world” => “keder ohulw”

# Other notes on Encryption
# You should be able to generate random numbers with leading zeros. In the example shown, the random number was 2715, so it should be zero padded to make it a five digit number (02715)
# Your translation should only translate using lowercase letters. If a letter is uppercase, it should use the lowercase translation, so in the example above, “HELLO WORLD” would still translate to “keder ohulw”
# If you encounter a character not in the character set, it should be translated as itself. Using the example above, “hello world!” should be translated as “keder ohulw!”
# Decrypting a Message
# In order to decrypt a message, we need to know the key and date that were used for encryption. We can find the total shifts using the same methods as above. Then each character is shifted backwards instead of forwards.

