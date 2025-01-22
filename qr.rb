require "rqrcode"

puts "Welcome to QR code generator!"
puts "What kind of QR code would you like to generate?"
puts
puts "1. Open a URL"
puts "2. Join a wifi network"
puts "3. Send a text message"
puts
puts "Press 4 to exit"

input = gets.chomp

if input == "4"
  puts "Goodbye!"
  exit
elsif input == "1"
  puts "Enter the URL that you'd like to encode:"
  url = gets.chomp
  encode = url.to_s
  puts "Enter the name for the PNG file:"
  name = gets.chomp
  
end

# Use the RQRCode::QRCode class to encode some text
qrcode = RQRCode::QRCode.new(encode)

# Use the .as_png method to create a 500 pixels by 500 pixels image
png = qrcode.as_png({ :size => 500 })

# Write the image data to a file
IO.binwrite("#{name}.png", png.to_s)
