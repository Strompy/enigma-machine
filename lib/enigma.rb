require 'Date'
require './lib/shift_generator'

class Enigma < ShiftGenerator
  attr_reader :char_array, :message, :key, :date, :shift, :shifts

  def initialize(message, key = KeyGenerator.new.create_key, date = OffsetGenerator.new.date)
    @char_array = ("a".."z").to_a << " "
    @message = message.downcase
    @key = key
    @date = date
    @shifts = []
    @output = {}
  end

  def encrypt
    create_shift
    create_shifts_array
    message_array = @message.split("")
    encrypted = message_array.map.with_index do |character, index|
      if index % 4 == 0
        encrypt_character(0, character)
      elsif index % 4 == 1
        encrypt_character(1, character)
      elsif index % 4 == 2
        encrypt_character(2, character)
      elsif index % 4 == 3
        encrypt_character(3, character)
      end
    end
    {encryption: encrypted.join, key: @key, date: @date}
  end

  def encrypt_character(hash, character)
    if char_array.include?(character)
      shifts[hash][character]
    else
      character
    end
  end

  def decrypt
    create_shift
    @shift.each { |key, value| @shift[key] = -value }
    create_shifts_array
    message_array = @message.split("")
    decrypted = message_array.map.with_index do |character, index|
      if index % 4 == 0
        encrypt_character(0, character)
      elsif index % 4 == 1
        encrypt_character(1, character)
      elsif index % 4 == 2
        encrypt_character(2, character)
      elsif index % 4 == 3
        encrypt_character(3, character)
      end
    end
    {decryption: decrypted.join, key: @key, date: @date}
  end

end
