require './lib/enigma.rb'

reader = File.open(ARGV[0], 'r')
incoming_text = reader.read
reader.close

encryptor = Enigma.new(incoming_text)
encryption = encryptor.encrypt

writer = File.open(ARGV[1], 'w')
writer.write(encryption)
writer.close

puts "Created '#{ARGV[1]}' with key: #{encryption[:key]} and date: #{encryption[:date]}"
