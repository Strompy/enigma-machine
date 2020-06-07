require './lib/enigma.rb'

reader = File.open(ARGV[0], 'r')
incoming_text = reader.read
reader.close

encryptor = Enigma.new(incoming_text, ARGV[2], ARGV[3])
decryption = encryptor.decrypt

writer = File.open(ARGV[1], 'w')
writer.write(decryption)
writer.close

puts "Created '#{ARGV[1]}' with key: #{decryption[:key]} and date: #{decryption[:date]}"
