require './lib/enigma.rb'

message_txt = File.read(ARGV[0]).chomp
e = Enigma.new
encrypted_message = e.encrypt(message_txt)
key = e.key

File.open(ARGV[1], 'w') do |char|
 char.puts encrypted_message
end

puts "Created #{ARGV[1]} with the key #{key} and date #{Date.today.strftime("%d%m%y")}"
