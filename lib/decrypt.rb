require './lib/enigma.rb'

encrypted_txt = File.read(ARGV[0]).chomp
known_key = ARGV[2].chomp
e = Enigma.new

e.decrypt(encrypted_txt, known_key)



  decrypted_file.write(decrypted_message)
  p "Created 'decrypted.txt' with the key #{key} and date #{today_date} "

File.open(ARGV[1], 'w') do |char|
 char.puts decrypted_message
end

puts "Created #{ARGV[1]} with the key #{key} and date #{Date.today.strftime("%d%m%y")}"