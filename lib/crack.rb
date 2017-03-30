require './lib/enigma.rb'

crack_message = File.read(ARGV[0]).chomp

cracker = Enigma.new

cracked_message = cracker.crack(crack_message)

File.open(ARGV[1], 'w') do |f|
  f.puts cracked_message
end

puts "Created #{ARGV[1]}"