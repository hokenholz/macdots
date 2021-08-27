require 'crypt/blowfish'

unless ARGV[0]
  puts "Usage: ruby decrypt.rb <Encrypted_filename.ext>"
  puts "Example: ruby decrypt.rb Encrypted_secret.stuff"
  exit
end

filename = ARGV[0].chomp
puts "Decrypting #{filename}."
p = "Decrypted_#{filename}"

if File.exists?(p)
  puts "File already exists."
  exit
end

print 'Enter your encryption key: '
kee = gets.chomp

begin
  blowfish = Crypt::Blowfish.new(kee)
  blowfish.decrypt_file(filename.to_str, p)
  puts 'Decryption SUCCESS!'
rescue Exception => e
  puts "An error occurred during decryption: \n #{e}."
end